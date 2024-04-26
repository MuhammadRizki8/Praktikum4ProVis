import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:profile_app/widgets/CardProfile.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductService _productService = ProductService();
  List<Product> _products = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      _products = await _productService.fetchProducts();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addProduct() async {
    try {
      // Dummy product data
      final product = Product(
        id: 0,
        title: "test data baru",
        category: "Dummy",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Snoop_Dogg_2019_by_Glenn_Francis.jpg/640px-Snoop_Dogg_2019_by_Glenn_Francis.jpg", // Placeholder image
        price: 19.99,
        description: "silahkan dibeli",
      );

      Product added = await _productService.addProduct(
        product.title,
        product.price,
        product.description,
        product.image,
        product.category,
      );
      // _products.add(added);
      setState(() {
        _products.add(added);
      });
    } catch (error) {
      print("Error adding product: $error");
      // Handle add product error (optional: show a snackbar or dialog)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 154, 218),
        title: const Text('Catalog'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MasonryView(
                  listOfItem: _products,
                  numberOfColumn: 2,
                  itemBuilder: (item) {
                    return CardProfile(item: item);
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
