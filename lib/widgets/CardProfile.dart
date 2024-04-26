import 'package:flutter/material.dart';
import '../models/product.dart';

class CardProfile extends StatelessWidget {
  final Product item;

  const CardProfile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 205, 234),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item.image,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Text('Could not load image'),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(item.category, style: const TextStyle(fontSize: 14)),
                Text(item.price.toString() + "\$",
                    style: const TextStyle(
                        fontSize: 16, color: Colors.deepPurpleAccent)),
                const SizedBox(height: 4),
                Text(item.description, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
