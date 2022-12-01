import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:products_crud/pages/pages.dart';
import 'package:products_crud/pages/product_list/controllers/controllers.dart';
import 'package:products_crud/repositories/models/models.dart';

import '../components/product_card.dart';

class ProductSection extends StatelessWidget {
  final List<ProductModel> products;
  final bool isMyProduct;
  const ProductSection(
      {super.key, required this.products, this.isMyProduct = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 350,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
        onTap: () async {
          final result = await Get.toNamed(
            ProductDetailPage.routeName,
            arguments: {
              'product': products[index],
              'isMyProduct': isMyProduct,
            },
          );
          if (result == true) {
            Get.find<DatabaseProductListController>().getProducts();
          }
        },
      ),
    );
  }
}
