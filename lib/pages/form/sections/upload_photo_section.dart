import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/form/components/dialog_take_photo.dart';
import 'package:products_crud/pages/form/controllers/controllers.dart';
import 'package:products_crud/preferences/preferences.dart';

class UploadPhotoSection extends GetView<FormController> {
  const UploadPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await dialogTakePhoto(controller);
      },
      child: GetBuilder<FormController>(
        builder: (controller) {
          if (controller.image.value == null && controller.imageUrl.isEmpty) {
            return _buildUploadPhoto();
          }
          return _buildCurrentPhoto();
        },
      ),
    );
  }

  Container _buildCurrentPhoto() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 24, right: 16),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: controller.image.value != null
                  ? DecorationImage(
                      image: FileImage(controller.image.value!),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: NetworkImage(controller.imageUrl.value),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Spacing.v16,
          const Text(
            "Change photo",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }

  Container _buildUploadPhoto() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 24, right: 16),
      child: Column(
        children: const [
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.indigo,
            size: 30,
          ),
          SizedBox(height: 16),
          Text(
            "Add photo",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }
}
