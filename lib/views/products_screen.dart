import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu_peek/controllers/products_controller.dart';
import 'package:timbu_peek/theme_controller.dart';
import 'package:timbu_peek/utils/app_theme.dart';
import 'package:timbu_peek/views/product_detail_screen.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsController productController = Get.put(ProductsController());
  final ThemeController themeSwitchController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timbu Peek'),
        actions: [
          Obx(() => IconButton(
            icon: Icon(themeSwitchController.isDarkTheme.value ? Icons.dark_mode : Icons.light_mode),
            onPressed: themeSwitchController.toggleTheme,
          )),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailScreen(product: product));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\₦${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[700],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.deepBlue,
        foregroundColor: Colors.white,
        child: Icon(Icons.refresh),
        onPressed: () {
          productController.fetchProducts();
        },
      ),
    );
  }
}
