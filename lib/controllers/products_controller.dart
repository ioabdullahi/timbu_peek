import 'package:get/get.dart';
import 'package:timbu_peek/data/api_client.dart';
import 'package:timbu_peek/models/products_model.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var products = <ProductsModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      print('Fetching products...');
      var fetchedProducts = await ApiClient().fetchProducts();
      print('Products fetched: ${fetchedProducts.length}');
      products.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching products: $e');
      errorMessage('Failed to fetch products. Please try again later.');
    } finally {
      isLoading(false);
      print('Fetch products completed');
    }
  }
}
