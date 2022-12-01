import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/preferences/preferences.dart';

import '../../repositories/repositories.dart';
import '../form/form.dart';

import 'sections/sections.dart';
import 'controllers/controllers.dart';

class ProductListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductProvider());
    Get.lazyPut<APIProductListController>(() =>
        APIProductListController(productProvider: Get.find<ProductProvider>()));
    Get.lazyPut<DatabaseProductListController>(
        () => DatabaseProductListController());
  }
}

class ProductListPage extends StatelessWidget {
  static const routeName = '/';
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Spacing.v16,
            GetBuilder<DatabaseProductListController>(
              builder: (controller) => controller.obx(
                (products) => products != null && products.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Your Products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          ProductSection(
                            products: products,
                            isMyProduct: true,
                          ),
                        ],
                      )
                    : Spacing.zero,
                onLoading: const ProductSkeleton(),
                onError: (error) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
            Spacing.v16,
            GetBuilder<APIProductListController>(
              builder: (controller) => controller.obx(
                (products) => products != null && products.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Other Products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          ProductSection(products: products),
                        ],
                      )
                    : Spacing.zero,
                onLoading: const ProductSkeleton(),
                onError: (error) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(FormPage.routeName);
          if (result == true) {
            Get.find<DatabaseProductListController>().getProducts();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
