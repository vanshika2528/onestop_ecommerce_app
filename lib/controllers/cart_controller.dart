// import 'package:ecommerce_app/models/product_model.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   var _cartItems = <Products>[].obs;
//   var quantity = 1.obs;
//   List<Products> get cartItems => _cartItems;
  
//   void addToCart(Products product) {
//     _cartItems.add(product);
//     print(product);
//   }

//   void removeFromCart(Products product) {
//     _cartItems.remove(product);
//   }
 
//   void setQuantity(int newQuantity,Products product) {
//     quantity.value = newQuantity;
//     print(quantity.value);
//   }

// }

// import 'package:get/get.dart';
// import 'package:ecommerce_app/models/product_model.dart';

// class CartController extends GetxController {
//   var _cartItems = <Products>[].obs;
//   List<Products> get cartItems => _cartItems;
//   RxInt quantityController = 1.obs;
  
//   void addToCart(Products product) {
//     // Find the existing product in the cart
//     Products? existingProduct = _cartItems.firstWhereOrNull(

//       (element) => element.id == product.id,
//     );

//     if (existingProduct != null) {
//       // If the product exists, increment the quantity
//       existingProduct.quantity.value += product.quantity.value;
//     } else {
//       _cartItems.add(product);
//     }

//     print(product);
//   }

//   void removeFromCart(Products product) {
//     _cartItems.remove(product);
//   }
 
//   void setQuantity(int newQuantity, Products product) {
//     if(_cartItems.contains(product)){
//        product.quantity.value += newQuantity;
//     }
//     else{
//        product.quantity.value = newQuantity;
//     }
//     print(product.quantity.value);
//       _cartItems.refresh();
//   }
// }
  // void updateProductQuantity(Products product) {
  //   int newQuantity = product.quantity.value;
  //   // Use newQuantity...
  // }
import 'package:get/get.dart';
import 'package:onestop/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;

  void addToCart(Products product, int quantity) {
    Products? existingProduct = cartItems.firstWhereOrNull((element) => element.id == product.id);
    if (existingProduct != null) {
      // If the product exists, increment the quantity
      existingProduct.quantity.value += quantity;
      print('existing product: ${existingProduct.quantity.value}');
    } else {
      // If the product doesn't exist, add it to the cart with the specified quantity
      product.quantity.value = quantity;
      cartItems.add(product);
      print('new product added: ${product.quantity.value}');
    }
  }

  void removeFromCart(Products product) {
    cartItems.remove(product);
  }

  int get totalItems => cartItems.length;

    void setQuantity(int newQuantity, Products product) {
    if(cartItems.contains(product)){
       product.quantity.value = newQuantity-1;
    }
    print('remaining product ${product.quantity.value}');
      cartItems.refresh();
  }
}




