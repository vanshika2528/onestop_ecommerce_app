import 'package:get/get.dart';
import 'package:onestop/models/product_model.dart';
import 'package:onestop/controllers/cart_controller.dart';

class ProductdetailsController extends GetxController {
  final CartController cartController = Get.put(CartController());

  void addToCart(Products product, int quantity) {
    print('quantity: $quantity');
    cartController.addToCart(product, quantity);
  }

  // void removeFromCart(Products product) {
  //   cartController.removeFromCart(product);
  // }

  // void setQuantity(int newQuantity, Products product) {
  //   product.quantity.value = newQuantity;
  //   print('product ${product} ${product.quantity.value}');
  // }
}

