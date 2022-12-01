import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products_crud/repositories/models/models.dart';
import 'package:products_crud/repositories/providers/firebase_provider.dart';

class FormController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // Handle form editing
  final RxBool isEditing = false.obs;
  final RxString imageUrl = ''.obs;
  final RxString productId = ''.obs;

  // Field Form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final Rxn<File> image = Rxn<File>();

  // Check if route from product detail
  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      final ProductModel product = arguments;
      isEditing.value = true;
      productId.value = product.id;
      nameController.text = product.title;
      categoryController.text = product.category;
      descriptionController.text = product.description;
      priceController.text = product.price.toString();
      imageUrl.value = product.image;
      update();
    }
  }

  // Field Form Validation
  void setPhotoFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        image.value = File(photo.path);
        update();
      }
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }

  void setPhotoFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        image.value = File(photo.path);
        update();
      }
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }

  // insert product to firebase
  void insertProduct() async {
    final FirebaseProvider provider = FirebaseProvider();
    if (formKey.currentState!.validate()) {
      if (image.value == null) {
        Get.snackbar(
          "Error",
          "Please upload photo",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      try {
        final String imageUrl = await provider.uploadImage(image.value!);
        final ProductModel product = ProductModel(
          id: '1',
          title: nameController.text,
          price: num.parse(priceController.text),
          description: descriptionController.text,
          category: categoryController.text,
          image: imageUrl,
          rating: ProductModelRating(
            rate: 0,
            count: 0,
          ),
        );
        await provider.addProduct(product);
        Get.back(result: true);
        Get.snackbar(
          "Success",
          "Product added",
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  // update product to firebase
  void updateProduct() async {
    final FirebaseProvider provider = FirebaseProvider();
    if (formKey.currentState!.validate()) {
      try {
        final ProductModel product = ProductModel(
          id: productId.value,
          title: nameController.text,
          price: num.parse(priceController.text),
          description: descriptionController.text,
          category: categoryController.text,
          image: imageUrl.value,
          rating: ProductModelRating(
            rate: 0,
            count: 0,
          ),
        );
        await provider.updateProduct(product);
        Get.back(result: true);
        Get.snackbar(
          "Success",
          "Product updated",
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
