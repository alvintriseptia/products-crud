import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/product_list/controllers/controllers.dart';

class ProductListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
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
      body: const Center(
        child: Text('Product List'),
      ),
    );
  }
}
