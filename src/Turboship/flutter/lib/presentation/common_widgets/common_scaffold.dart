import 'package:flutter/material.dart';

import '../../core/extensions/all.dart';
import '../../core/utils/view_util.dart';
import '../resource/styles/all.dart';

class CommonScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  final Widget body;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;
  final bool? drawer;
  final bool applyAutoPaddingBottom;
  final EdgeInsets padding;
  final Widget? bottomNavigationBar;

  const CommonScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.hideKeyboardWhenTouchOutside = false,
    this.applyAutoPaddingBottom = false,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      drawer: drawer == true
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : Container(),
      backgroundColor: backgroundColor ?? context.colorTheme.bgSurfaceMain,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: Padding(
        padding: _getPadding(context),
        child: body,
      ),
    );

    return hideKeyboardWhenTouchOutside
        ? GestureDetector(
            onTap: () => ViewUtil.hideKeyboard(context),
            child: scaffold,
          )
        : scaffold;
  }

  EdgeInsetsGeometry _getPadding(BuildContext context) {
    if (!applyAutoPaddingBottom) {
      return padding;
    }

    var bottomPadding = context.bottomPadding;
    if (bottomPadding == 0) {
      bottomPadding = Sizes.s16;
    }

    return padding.copyWith(bottom: bottomPadding);
  }
}
