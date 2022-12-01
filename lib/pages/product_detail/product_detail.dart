import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: GetBuilder<ProductDetailController>(
        builder: (controller) {
          if (controller.product.value == null) {
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
                ActionButtonSection(
                  onEdit: () {},
                  onDelete: () {},
                ),
                Spacing.v24,
              ],
            );
          }
        },
      ),
    );
  }
}
