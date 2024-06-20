import 'package:onestop/screen/productDetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestop/controllers/cart_controller.dart';
import 'package:onestop/controllers/navigation_controller.dart';
class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final NavController navController = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Default is 56.0
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff000428), Color(0xff004e92)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
          ),
          child: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
           iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () { 
            Get.back();},
        ),
      ),
    ),
  ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18)));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var product = cartController.cartItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        leading: GestureDetector(
                          onTap: () {
                            Get.to(ProductDetails(product: product));
                          },
                          child: Image.network(
                            product.image,
                             height: screenHeight * 0.10,  // 7% of screen height
                             width: screenWidth * 0.20, 
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          product.title,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Price: ₹${product.price}",
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                                SizedBox(width: 10),
                                Obx(() => Text(
                                  "Qty: ${product.quantity.value}",
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                )),
                              ],
                            ),
                            Obx(() => Text(
                              "Total: ₹${(product.price * product.quantity.value).toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle_outline, color: const Color.fromARGB(255, 6, 6, 6)),
                          onPressed: () {
                            if (product.quantity.value > 1) {
                              cartController.setQuantity(product.quantity.value, product);
                            } else {
                              cartController.removeFromCart(product);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(

                  children: [
                    Obx(() {
                      int totalItems = cartController.cartItems.fold(
                        0,
                        (sum, item) => sum + item.quantity.value,
                      );
                      double totalAmount = cartController.cartItems.fold(
                        0.0,
                        (sum, item) => sum + (item.price * item.quantity.value),
                      );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Products: $totalItems",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Total Amount: ₹${totalAmount.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.offNamed('address');
                      },
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 187, 57),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }   
      }
      ),
       bottomNavigationBar: Obx(() {
                      return BottomNavigationBar(
                        currentIndex: navController.selectedIndex.value,
                        onTap: (index) {
                          navController.changePage(index);
                           switch (index) {
                            case 0:
                              Get.offNamed('home');
                              break;
                            case 1:
                              Get.toNamed('cart');
                              break;
                            case 2:
                              Get.toNamed('profile');
                              break;
                          }
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart),
                            label: 'Cart',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Profile',
                          ),
                        ],
                      );
       }
       ),
    );
  }
}
