import 'package:flutter/material.dart';

class NoScrollbar extends StatelessWidget {
  final Widget child;
  const NoScrollbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(true ? 10 : 30),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
