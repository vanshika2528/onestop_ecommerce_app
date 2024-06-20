import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestop/controllers/navigation_controller.dart';
import 'package:onestop/screen/cart_screen.dart';
import 'package:onestop/screen/home_screen.dart';
import 'package:onestop/screen/profile_screen.dart';
// import 'package:onestop/screen/home_screen.dart';
// import 'package:onestop/screen/cart_screen.dart';
// import 'package:onestop/screen/profile_screen.dart';

class BottomNavigationbarr extends StatelessWidget {
  BottomNavigationbarr({super.key});
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        switch (navController.selectedIndex.value) {
            case 0:
          return HomeScreen(); // Assuming named routes are used
        case 1:
          return CartScreen();
        case 2:
          return ProfileScreen();
        default:
          return HomeScreen();
        }
      }
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: navController.selectedIndex.value,
          showSelectedLabels: true,
          onTap: (index) {
            navController.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 8, 60, 93),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
