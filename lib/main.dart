import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestop/controllers/cart_controller.dart';
import 'package:onestop/controllers/imagepicker_controller.dart';
import 'package:onestop/controllers/login_controller.dart';
import 'package:onestop/controllers/productDetails_controller.dart';
import 'package:onestop/controllers/wishlist_controller.dart';
import 'package:onestop/screen/address_screen.dart';
// import 'package:onestop/screen/bottom_navigation.dart';
import 'package:onestop/screen/cart_screen.dart';
import 'package:onestop/screen/home_screen.dart';
import 'package:onestop/screen/image_screen.dart';
import 'package:onestop/screen/login_screen.dart';
import 'package:onestop/screen/payment_screen.dart';
import 'package:onestop/screen/profile_screen.dart';
import 'package:onestop/screen/splash_screen.dart';
import 'package:onestop/screen/userDetails_screen.dart';
import 'package:onestop/screen/wishlist_screen.dart';
import 'screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'OneStop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
       scaffoldBackgroundColor: Colors.white, 
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/sign', page: () => SignupScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/wish', page: () => WishCartScreen()),
        GetPage(name: '/user', page: () => UserdetialsScreen()),
        GetPage(name: '/payment', page: () =>PaymentOptionsPage()),
        GetPage(name: '/image', page: () => ImagePickerScreen ()),
        GetPage(name: '/address', page: () => AddressScreen ()),
      ],
      initialBinding: BindingsBuilder((){
        Get.put(CartController());
        Get.put(WishlistController());
        Get.put(ImageController());
        Get.put(ProductdetailsController());
        Get.put(LoginController());
      }),
       debugShowCheckedModeBanner: false,
      // home:BottomNavigationbar()
    );
  }
}
