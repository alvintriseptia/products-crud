import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (Get.find<FormController>()
                    .formKey
                    .currentState!
                    .validate()) {
                  Get.snackbar('Success', 'Form is valid');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
