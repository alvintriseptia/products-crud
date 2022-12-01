import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Product'),
      content: const Text('Are you sure you want to delete this product?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('No', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: const Text('Yes', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
