import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:products_crud/pages/pages.dart';
import 'package:products_crud/repositories/models/models.dart';

import '../components/product_card.dart';

class ProductSection extends StatelessWidget {
  final List<ProductModel> products;
  const ProductSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
        onTap: () => Get.toNamed(ProductDetailPage.routeName,
            arguments: products[index]),
      ),
    );
  }
}
