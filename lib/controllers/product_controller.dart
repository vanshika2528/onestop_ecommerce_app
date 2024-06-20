import '../models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Products>[].obs;
  var filteredProductList = <Products>[].obs;
  var selectedCategory = 'all'.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var products = List<Products>.from(data.map((item) => Products.fromJson(item)));
        productList.value = products;
        filteredProductList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void filterProducts(String category) {
    if (category == 'all') {
      filteredProductList.value = productList;
    } else {
      filteredProductList.value = productList.where((product) => product.category == category).toList();
    }
    selectedCategory.value = category;
  }
}
