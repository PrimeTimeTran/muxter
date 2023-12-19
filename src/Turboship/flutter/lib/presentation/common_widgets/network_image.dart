import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resource/all.dart';
import 'all.dart';

const _kDefaultImageCacheWidth = 1000;
const _kDefaultImageCacheHeight = 2000;

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.url, {
    super.key,
    this.fit,
    this.placeholder,
    this.fallbackWidget,
    this.imageBuilder,
    this.width,
    this.height,
    this.fadeOutDuration,
    this.fadeOutCurve = Curves.easeOut,
    this.useOldImageOnUrlChange = false,
    this.memCacheSize,
    this.loadingBackgroundColor,
  });

  final String url;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? fallbackWidget;
  final Widget Function(
    BuildContext context,
    ImageProvider imageProvider,
  )? imageBuilder;
  final double? width;
  final double? height;
  final Duration? fadeOutDuration;
  final Curve fadeOutCurve;
  final bool useOldImageOnUrlChange;
  final Color? loadingBackgroundColor;
  final Size? memCacheSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) => placeholder ?? const AppDefaultLoading(),
      errorWidget: (_, __, dynamic error) => fallbackWidget ?? _buildFallBackWidget(context, error),
      imageBuilder: imageBuilder,
      fadeOutDuration: fadeOutDuration,
      fadeInDuration: Duration.zero,
      fadeOutCurve: fadeOutCurve,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      memCacheWidth: (memCacheSize?.width ?? width ?? _kDefaultImageCacheWidth).round(),
      memCacheHeight: (memCacheSize?.height ?? height ?? _kDefaultImageCacheHeight).round(),
    );
  }

  Widget _buildFallBackWidget(BuildContext context, error) {
    return SizedBox(
      width: width,
      height: height,
      child: Assets.images.placeholder.image(),
    );
  }
}

class AppCachedNetworkImageProvider extends CachedNetworkImageProvider {
  const AppCachedNetworkImageProvider(super.url);
}
