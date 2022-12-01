import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/form/controllers/controllers.dart';

class FormFieldSection extends GetView<FormController> {
  const FormFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // product name
        TextFormField(
          controller: controller.nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'Enter product name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter product name';
            }
            return null;
          },
        ),

        // category
        TextFormField(
          controller: controller.categoryController,
          decoration: const InputDecoration(
            labelText: 'Category',
            hintText: 'Enter product category',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter product category';
            }
            return null;
          },
        ),

        // price
        TextFormField(
          controller: controller.priceController,
          decoration: const InputDecoration(
            labelText: 'Price',
            hintText: 'Enter product price',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter product price';
            }
            return null;
          },
        ),

        // description
        TextFormField(
          controller: controller.descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Enter product description',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter product description';
            }
            return null;
          },
          maxLines: null,
          maxLength: 300,
        ),
      ],
    );
  }
}
