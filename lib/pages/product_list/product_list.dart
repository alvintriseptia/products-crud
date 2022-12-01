import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositories/repositories.dart';
import '../form/form.dart';

import 'sections/sections.dart';
import 'controllers/controllers.dart';

class ProductListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductProvider());
    Get.lazyPut<ProductListController>(() =>
        ProductListController(productProvider: Get.find<ProductProvider>()));
  }
}

class ProductListPage extends GetView<ProductListController> {
  static const routeName = '/';
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: controller.obx(
        (products) => products != null
            ? ProductSection(products: products)
            : const ProductSkeleton(),
        onLoading: const ProductSkeleton(),
        onError: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(FormPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
