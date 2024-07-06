import 'package:flutter/material.dart';
import 'package:timbu_peek/models/products_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsModel product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\₦${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
