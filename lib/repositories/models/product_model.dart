class ProductModel {
  final String id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final ProductModelRating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: ProductModelRating.fromJson(json['rating']),
    );
  }

  static List<ProductModel> listFromJson(List<dynamic> json) {
    return json.map((value) => ProductModel.fromJson(value)).toList();
  }
}

class ProductModelRating {
  final num rate;
  final int count;

  ProductModelRating({
    required this.rate,
    required this.count,
  });

  factory ProductModelRating.fromJson(Map<String, dynamic> json) {
    return ProductModelRating(
      rate: json['rate'],
      count: json['count'],
    );
  }

  static listFromJson(List<dynamic> json) {
    return json.map((e) => ProductModelRating.fromJson(e)).toList();
  }
}
