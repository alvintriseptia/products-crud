import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/form/form.dart';
import 'package:products_crud/pages/product_detail/components/delete_dialog.dart';
import 'package:products_crud/pages/product_detail/sections/sections.dart';
import 'package:products_crud/repositories/models/models.dart';
import 'package:products_crud/preferences/preferences.dart';

import 'controllers/controllers.dart';

class ProductDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}

class ProductDetailPage extends GetView<ProductDetailController> {
  static const routeName = '/product-detail';
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: controller.isEdited.value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(result: controller.isEdited.value);
            },
          ),
        ),
        body: GetBuilder<ProductDetailController>(
          builder: (controller) {
            if (controller.product.value == null ||
                controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final ProductModel product = controller.product.value!;
              return ListView(
                children: [
                  ImageHeaderSection(imageUrl: product.image),
                  Spacing.v16,
                  ProductTitleSection(
                    title: product.title,
                    price: product.price,
                    rating: product.rating,
                  ),
                  Spacing.v16,
                  Spacing.divider,
                  Spacing.v16,
                  ProductContentSection(
                    category: product.category,
                    description: product.description,
                  ),
                  Spacing.v24,
                  controller.isMyProduct.value
                      ? ActionButtonSection(
                          onEdit: () async {
                            final result = await Get.toNamed(
                              FormPage.routeName,
                              arguments: product,
                            );
                            if (result == true) {
                              controller.getProduct();
                            }
                          },
                          onDelete: () async {
                            final result = await Get.dialog(
                              const DeleteDialog(),
                              barrierDismissible: false,
                            );
                            if (result == true) {
                              controller.deleteProduct();
                            }
                          },
                        )
                      : Spacing.zero,
                  Spacing.v24,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
