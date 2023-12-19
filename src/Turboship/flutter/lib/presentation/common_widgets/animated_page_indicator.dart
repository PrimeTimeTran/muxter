import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/extensions/context_extensions.dart';

class AppPageIndicator extends StatefulWidget {
  const AppPageIndicator({
    required this.count,
    required this.controller,
    super.key,
    this.onDotPressed,
    this.color,
    this.dotSize,
  });

  final int count;
  final PageController controller;
  final void Function(int index)? onDotPressed;
  final Color? color;
  final double? dotSize;

  @override
  State<AppPageIndicator> createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  final _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handlePageChanged);
    super.dispose();
  }

  void _handlePageChanged() {
    _currentPage.value = widget.controller.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: 30,
          alignment: Alignment.center,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (_, value, child) {
              return Container();
            },
          ),
        ),
        Positioned.fill(
          child: Center(
            child: SmoothPageIndicator(
              controller: widget.controller,
              count: widget.count,
              onDotClicked: widget.onDotPressed,
              effect: WormEffect(
                dotWidth: widget.dotSize ?? 6,
                dotHeight: widget.dotSize ?? 6,
                strokeWidth: (widget.dotSize ?? 6) / 2,
                spacing: widget.dotSize ?? 6,
                activeDotColor: widget.color ?? context.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
