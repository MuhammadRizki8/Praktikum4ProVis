import 'dart:convert';
import "package:http/http.dart" as http;
import '../models/product.dart';

class ProductService {
  static const String _baseUrl = "https://fakestoreapi.com";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl + "/products"));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception("gagal load foto");
    }
  }

  Future<Product> addProduct(String title, double price, String description,
      String image, String category) async {
    final response = await http.post(
      Uri.parse(_baseUrl + "/products"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      }),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add product: ${response.body}");
    }
  }
}
