import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:products_crud/repositories/models/models.dart';
import 'package:products_crud/preferences/preferences.dart';

class ProductTitleSection extends StatelessWidget {
  final String title;
  final num price;
  final ProductModelRating rating;

  const ProductTitleSection(
      {super.key,
      required this.title,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Spacing.v8,
          Text(
            '\$ $price',
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacing.v4,
          Row(
            children: [
              RatingBar.builder(
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                initialRating: rating.rate.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ignoreGestures: true,
                onRatingUpdate: (rating) {},
                itemSize: 16,
              ),
              Spacing.h8,
              Text(
                '(${rating.count}) reviews',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
