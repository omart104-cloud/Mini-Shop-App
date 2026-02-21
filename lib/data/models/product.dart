class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price;
  final double discountPercentage;
  final double rating;
  final int reviewCount;
  final String brand;
  final String category;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviewCount,
    required this.brand,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final reviews = json['reviews'] as List<dynamic>? ?? [];
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num? ?? 0).toDouble(),
      rating: (json['rating'] as num? ?? 0).toDouble(),
      reviewCount: reviews.isNotEmpty
          ? reviews.length
          : (json['stock'] as int? ?? 0),
      brand: json['brand'] as String? ?? json['category'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );
  }

  double get priceEgp => (price * 50).roundToDouble();
}
