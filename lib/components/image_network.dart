import 'package:flutter/material.dart';
import 'package:products_crud/preferences/assets.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ImageNetwork(
      {super.key, required this.url, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(Assets.productPlaceholder),
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      fit: fit ?? BoxFit.cover,
    );
  }
}
