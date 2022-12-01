import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/form/controllers/controllers.dart';

Future dialogTakePhoto(FormController controller) {
  return showDialog(
    context: Get.context!,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              controller.setPhotoFromCamera();
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: Get.width,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text(
                'Camera',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(thickness: 1.2, color: Colors.grey),
          GestureDetector(
            onTap: () {
              controller.setPhotoFromGallery();
              Get.back();
            },
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
