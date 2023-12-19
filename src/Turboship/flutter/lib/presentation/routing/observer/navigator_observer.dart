import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

getTabName(location) {
  try {
    location = location.toLowerCase();
    List<String> result = location.split('/tab_');
    String tabValue = result[1].split('_')[0];
    return tabValue;
  } catch (e) {
    debugPrint('Error: $e');
  }
}

// TODO: add firebase analytics here
@lazySingleton
class AppNavigatorObserver extends NavigatorObserver with LogMixin {
  static const _enableLog = LogConfig.enableNavigatorObserverLog;

  String? previousRouteName;
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    LogUtil.i(name: 'Observer', 'didPop');
    previousRouteName = previousRoute?.settings.name;
    // If true is stacked, if false is root of stack
    if (!route.navigator!.canPop()) {
      final tabName = getTabName('/${route.settings.name}');
      AppRouter.navMap[tabName] = false;
    }
    if (_enableLog) {
      logDebug(
        'didPop ${route.settings.name}, back to ${previousRoute?.settings.name}',
      );
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    LogUtil.i(name: 'Observer', 'didPush');
    previousRouteName = previousRoute?.settings.name;
    final tabName = getTabName('/${route.settings.name}');
    if (route.isFirst) {
      AppRouter.navMap[tabName] = false;
    }
    if (_enableLog) {
      logDebug(
        'didPush from ${previousRoute?.settings.name} to ${route.settings.name}',
      );
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    LogUtil.i(name: 'Observer', 'didRemove');
    previousRouteName = previousRoute?.settings.name;
    final tabName = getTabName('/${route.settings.name}');
    // print('GoRouterObserver didRemove: tabName $tabName');
    // print('GoRouterObserver didRemove: currentResult ${route.currentResult}');
    // print('GoRouterObserver didRemove: isActive ${route.isActive}');
    // print('GoRouterObserver didRemove: isCurrent ${route.isCurrent}');
    // print('GoRouterObserver didRemove: isFirst ${route.isFirst}');
    // print('GoRouterObserver didRemove: popped ${route.popped}');
    AppRouter.navMap[tabName] = false;
    if (_enableLog) {
      logDebug(
        'didRemove ${route.settings.name}, back to ${previousRoute?.settings.name}',
      );
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    LogUtil.i(name: 'Observer', 'didReplace');
    previousRouteName = oldRoute?.settings.name;

    if (_enableLog) {
      logDebug(
        'didReplace ${oldRoute?.settings.name} by ${newRoute?.settings.name}',
      );
    }
  }

  String? previousRoutePath() {
    return AppPages.values
        .firstWhereOrNull((element) => element.path == previousRouteName)
        ?.name;
  }
}
