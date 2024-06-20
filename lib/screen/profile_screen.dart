import 'package:onestop/controllers/imagepicker_controller.dart';
import 'package:onestop/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/navigation_controller.dart';
class ProfileScreen extends StatelessWidget {
  // final int currentIndex = 2;
  // ProfileScreen(currentIndex = currentIndex);
  final UserController userController = Get.put(UserController());
  final ImageController imageController = Get.put(ImageController());
  final NavController navController = Get.put(NavController());
   final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
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
          child: AppBar(
            title: Text('Profile',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent, // Make it transparent to show the gradient
            elevation: 0, // Remove shadow
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() =>  
            imageController.selectedImage.value == null ? 
                                Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(
                                    color: Colors.black, // Border color
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.white, // CircleAvatar background color
                                    child: Icon(Icons.person, size: 100, color: Colors.grey),
                                  ),
                                )
                                :  Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(
                                    color: Colors.black, // Border color
                                    shape: BoxShape.circle,
                                  ),
                                  child:CircleAvatar(
                                radius: 60,
                                backgroundImage:FileImage(imageController.selectedImage.value!,
                                    ),
                                  ),
                                ),
            ),
            SizedBox(height: 5),
            Text(
              '${userController.username}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          
            SizedBox(height: 5),
            Text(
              '${userController.username}5@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              onTap: () {
                // Handle account settings tap
                Get.toNamed('image');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                // Handle help & support tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout tap
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                loginController.clearCredentials();
                Get.offAllNamed('/login'); // Navigate to the login page
              },
            ),
          ],
        );
      },
    );
  }
}