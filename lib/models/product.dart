class Product {
  final int id;
  final String title;
  final String category;
  final String description;
  final String image;
  final double price;
  // final Map<String, dynamic> rating;

  Product(
      {required this.id,
      required this.title,
      required this.category,
      required this.image,
      required this.price,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      category: json["category"],
      image: json["image"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
    );
  }
}
