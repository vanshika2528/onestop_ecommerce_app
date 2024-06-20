import 'package:onestop/controllers/productDetails_controller.dart';
import 'package:onestop/controllers/wishlist_controller.dart';
import 'package:onestop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final Products product;
  final WishlistController wishlistController = Get.put(WishlistController());
  final ProductdetailsController productDetailsController = Get.put(ProductdetailsController());
  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
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
        child:AppBar(
        title: const Text('Product Details',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent, 
        automaticallyImplyLeading: false,
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // set color to white
          onPressed: () {
            Get.back();
          },
         ),
         actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart,
          color: Colors.white,),
          onPressed: () {
            product.selectedQuantity.value=1;
            Get.toNamed('cart');
              },
            ),
          ],
         ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.08), // 8% of screen width
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[    
              Container(
              decoration: BoxDecoration(
                 color: Colors.white, 
                borderRadius: BorderRadius.circular(15), // Add rounded corners
                boxShadow: [ // Add shadow
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                border: Border.all( // Add border
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.contain,
                              height: screenHeight*0.5,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              child: ClipRRect( // Clip the image to match the borderRadius of the container
                borderRadius: BorderRadius.circular(15), 
                child: Image.network(
                  product.image,
                  height: screenHeight * 0.3, // 40% of screen height
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              ),
              ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.055, // 4.5% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),      
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Price: ₹${product.price}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // 4% of screen width
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Row(children: [
                Text(
                  "Rating: ${product.rating.rate}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // 4% of screen width
                    color: Colors.blue,
                  ),
                ),
                   SizedBox(width: screenWidth * 0.02),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: _buildStarIcons(product.rating.rate),
                                      ),
                ],),
                SizedBox(height: screenHeight * 0.002),
                Text(
                  "Available: ${product.rating.count}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // 4% of screen width
                    color:Color.fromARGB(255, 2, 87, 28),
                  ),
                ),
                
               
               SizedBox(height: screenHeight * 0.005),
              
                Container(
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Product Descrioption",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.048, // Adjust the size as needed
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                                Text(
                                product.description,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045, // Adjust the size as needed
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ),
                SizedBox(height: screenHeight * 0.01),
               Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Increased padding
                      width: screenWidth * 0.28,
                      height: screenHeight*0.05,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 242, 242, 242),
                        border: Border.all(
                          color: const Color.fromARGB(255, 203, 202, 202), // Changed to a more vibrant color
                          width: 1.5, // Slightly thicker border
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                         Padding(
                            padding: const EdgeInsets.only(bottom: 3.5), // Adjust the padding value as needed
                            child: Text(
                              'Qty: ',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045, // Slightly larger text
                                fontWeight: FontWeight.bold, // Bolder text
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Obx(
                                () => DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        elevation: 0,
                                        value: product.selectedQuantity.value,
                                        items: List.generate(10, (index) => index + 1)
                                            .map((value) => DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text('$value'),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          if (value != null) {
                                            product.selectedQuantity.value = value;
                                          }
                                        },
                                      ),
                                    ),
                            )
                        ],
                      ),
                    ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              productDetailsController.addToCart(product, product.selectedQuantity.value);
                              Get.snackbar(
                                'Added to Cart',
                                '${product.title} has been added to your cart!',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: Duration(seconds: 1),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // Button background color
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                                vertical: screenHeight * 0.015, // 1.5% of screen height for a balanced look
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.black),
                              ),
                              elevation: 2, // Adding some elevation for a raised button effect
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center the content within the button
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Color.fromARGB(255, 8, 60, 93),
                                ),
                                SizedBox(width: 8), // Adjust space between icon and text for better spacing
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045, // 4.5% of screen width for a consistent text size
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 8, 60, 93),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          ElevatedButton(
                            onPressed: () {
                              wishlistController.toggleFavorite(product);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // Button background color
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.07,
                                vertical: screenHeight * 0.015, // 1.5% of screen height for a balanced look
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.black),
                              ),
                              elevation: 2, // Adding some elevation for a raised button effect
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center the content within the button
                              children: [
                                Obx(() => Icon(
                                      Icons.favorite,
                                      color: product.isFavorite.value ? Colors.pink : Color.fromARGB(255, 8, 60, 93),
                                    )),
                                SizedBox(width: 8), // Adjust space between icon and text for better spacing
                                Text(
                                  'Wishlist',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045, // 4.5% of screen width for a consistent text size
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 8, 60, 93),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('address');
                    },
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        color: Colors.white,  // Change text color to red
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.285, // 5% of screen width
                        vertical: screenHeight * 0.02,  // 2% of screen height
                      ),
                      shape: RoundedRectangleBorder(  // Make the button rectangular
                        side: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ),
       
    );
  }

List<Widget> _buildStarIcons(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.amber,
        size:20,
      ));
    }
    if (rating - fullStars > 0) {
      stars.add(Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 20.0,
      ));
    }
    while (stars.length < 5) {
      stars.add(Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20.0,
      ));
    }
    return stars;
  }
}

