import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/form/sections/sections.dart';
import 'package:products_crud/preferences/preferences.dart';

import 'controllers/controllers.dart';

class FormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
  }
}

class FormPage extends GetView<FormController> {
  static const routeName = '/form';
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        key: Get.find<FormController>().formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const FormFieldSection(),
            Spacing.v16,
            const UploadPhotoSection(),
            ActionButtonSection(
              onSubmitted: controller.isEditing.value
                  ? controller.updateProduct
                  : controller.insertProduct,
              title: controller.isEditing.value ? 'Update' : 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
