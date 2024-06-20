import 'package:onestop/controllers/wishlist_controller.dart';
import 'package:onestop/screen/productDetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishCartScreen extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (wishlistController.wishlistItems.isEmpty) {
          return Center(child: Text('Your wishlist is empty',
          style: TextStyle(
            fontSize: 20,
          ),));
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: wishlistController.wishlistItems.length,
                  itemBuilder: (context, index) {
                    var product = wishlistController.wishlistItems[index];
                    return ListTile(
                     leading: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(product: product));
                        },
                        child: Image.network(
                          product.image,
                          height: screenHeight * 0.07, // 7% of screen height
                          width: screenWidth * 0.15, // 15% of screen width
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        product.title,
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                      subtitle: Text(
                        "Price: ₹${product.price.toString()}",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle_outlined, size: screenWidth * 0.07),
                        onPressed: () {
                          wishlistController.toggleFavorite(product);
                        },
                      ),
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
              //   child: Column(
              //     children: [
              //       Obx(() {
              //         double totalAmount = wishlistController.wishlistItems.fold(
              //           0.0,
              //           (sum, item) => sum + item.price,
              //         );
              //         return Text(
              //           "Total: ₹${totalAmount.toStringAsFixed(2)}",
              //           style: TextStyle(
              //             fontSize: screenWidth * 0.05,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         );
              //       }),
              //       SizedBox(height: screenHeight * 0.02), // 2% of screen height
              //       ElevatedButton(
              //         onPressed: () {
              //           Get.toNamed('payment');
              //         },
              //         child: Text(
              //           'Place Order',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: screenWidth * 0.045,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color.fromARGB(255, 255, 187, 57),
              //           padding: EdgeInsets.symmetric(
              //             horizontal: screenWidth * 0.2, // 20% of screen width
              //             vertical: screenHeight * 0.02, // 2% of screen height
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        }
      }),
    );
  }
}
