import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turboship/all.dart';

class DrawerWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DrawerWrapper({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('DrawerWrapper'));

  @override
  Widget build(BuildContext context) {
    final tabIdx = navigationShell.currentIndex;
    return Scaffold(
      appBar: getAppBar(tabIdx),
      drawer: _buildDrawer(context),
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: C(context, Kolor.onPrimary),
          border: Border(
            top: BorderSide(
              color: C(context, Kolor.outline),
            ),
          ),
        ),
        height: 88.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: AppRouter.tabs.asMap().entries.map((entry) {
            final idx = entry.key;
            final e = entry.value;
            return _buildTabItem(
              idx: idx,
              context: context,
              location: e.path,
              icon: _getTabIcon(e),
              isSelected: tabIdx == idx,
            );
          }).toList(),
        ),
      ),
    );
  }

  buildTabItem(context, String label, icon, bool selected) {
    return BottomNavigationBarItem(
      label: label,
      icon: AppIcon(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.s2,
          vertical: Sizes.s10,
        ),
        icon: icon,
        size: Sizes.s4,
        color: selected
            ? C(context, Kolor.primary)
            : C(context, Kolor.onBackground),
      ),
    );
  }

  getAppBar(int idx) {
    return AppRouter.isTabStacked(idx)
        ? null
        : AppBar(
            title: Text(AppRouter.getTabTitle(idx)),
            automaticallyImplyLeading: AppRouter.hasDrawer(idx),
            leading: AppRouter.hasDrawer(idx)
                ? Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  )
                : null,
          );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Turboship'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              context.goNamed(AppPages.settings.name);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              context.goNamed(AppPages.settings.name);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required int idx,
    required bool isSelected,
    required String location,
    required SvgGenImage icon,
    required BuildContext context,
  }) {
    final box = isSelected
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: C(context, Kolor.onSecondary),
          )
        : null;
    final item = Container(
      decoration: box,
      margin: AppSpacing.edgeInsetsAll4,
      child: AppIcon(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.s10,
          horizontal: Sizes.s32,
        ),
        icon: icon,
        size: Sizes.s20,
        color: C(
          context,
          isSelected ? Kolor.primary : Kolor.onPrimaryContainer,
        ),
      ),
    );

    return item.clickable(() => _onTap(context, idx));
  }

  SvgGenImage _getTabIcon(AppPages page) {
    switch (page) {
      case AppPages.tabARoot:
        return Assets.icons.home;
      case AppPages.tabBRoot:
        return Assets.icons.calendar;
      case AppPages.tabCRoot:
        return Assets.icons.history;
      case AppPages.tabDRoot:
        return Assets.icons.user;
      default:
        return Assets.icons.home;
    }
  }

  void _onTap(BuildContext context, int idx) {
    final location = idx == navigationShell.currentIndex;
    AppRouter.navMap['tabIdx'] = idx;
    navigationShell.goBranch(
      idx,
      initialLocation: location,
    );
  }
}
