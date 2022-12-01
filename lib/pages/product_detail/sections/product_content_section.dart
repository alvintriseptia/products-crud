import 'package:flutter/material.dart';
import 'package:products_crud/preferences/preferences.dart';

class ProductContentSection extends StatelessWidget {
  final String category;
  final String description;
  const ProductContentSection(
      {super.key, required this.category, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category: $category',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Spacing.v8,
          Text(
            'Description',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Spacing.v8,
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
