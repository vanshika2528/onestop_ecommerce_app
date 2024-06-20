import 'package:onestop/models/product_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlistItems = <Products>[].obs;

  void toggleFavorite(Products product) {
    if (wishlistItems.contains(product)) {
     wishlistItems.remove(product);
      product.isFavorite.value = false;
    } else {
      wishlistItems.add(product);
      product.isFavorite.value = true;
    }
  }

}
