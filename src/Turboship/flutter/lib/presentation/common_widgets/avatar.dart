import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const Avatar({
    super.key,
    required this.imageUrl,
    this.size = 72.0,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(imageUrl!),
          )
        : CircleAvatar(
            radius: size / 2,
            child: const Icon(Icons.person),
          );
  }
}
