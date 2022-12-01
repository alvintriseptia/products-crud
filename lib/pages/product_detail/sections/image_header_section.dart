import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageHeaderSection extends StatelessWidget {
  final String imageUrl;
  const ImageHeaderSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.45,
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
