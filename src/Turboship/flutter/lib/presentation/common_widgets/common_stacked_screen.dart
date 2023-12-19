import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turboship/all.dart';

class ScreenStacked extends StatefulWidget {
  final String name;
  final String path;
  final String tab;
  final Widget? child;
  const ScreenStacked(
      {super.key,
      required this.name,
      required this.path,
      required this.tab,
      this.child});

  @override
  State<ScreenStacked> createState() => _ScreenStackedState();
}

class _ScreenStackedState extends State<ScreenStacked> {
  @override
  Widget build(BuildContext context) {
    final root = AppRouter.navMap[widget.tab];
    return Scaffold(
      appBar: root == true
          ? AppBar(
              title: Text(widget.name),
            )
          : null,
      body: widget.child ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('Add to ${widget.tab} stack'),
                onPressed: () {
                  AppRouter.navMap[widget.tab] = true;
                  final destination = AppPages.entity.path;
                  GoRouter.of(context).push(destination);
                },
              ),
            ],
          ),
    );
  }
}
