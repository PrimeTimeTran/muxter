import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String? url;
  const PostImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    final hasImage = url != null;
    return hasImage
        ? Image.network(
            url!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Text('Error loading image');
            },
          )
        : Container();
  }
}
