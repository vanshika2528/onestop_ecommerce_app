// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorTween;

//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     _colorTween = TweenSequence<Color?>([
//       TweenSequenceItem(
//         weight: 1.0,
//         tween: ColorTween(
//           begin: Colors.red,
//           end: Colors.green,
//         ),
//       ),
//       TweenSequenceItem(
//         weight: 1.0,
//         tween: ColorTween(
//           begin: Colors.green,
//           end: Colors.blue,
//         ),
//       ),
//     ]).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _navigateToHome() async {
//     await Future.delayed(const Duration(seconds: 2), () {});
//     Get.offNamed('login');
//     // Get.offNamed('home');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/logo.jpg',
//               height: screenHeight * 0.2,  // 20% of screen height
//             ),
           
//             SizedBox(height: screenHeight * 0.03),  // 3% of screen height
//             AnimatedBuilder(
//               animation: _colorTween,
//               builder: (context, child) {
//                 return CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color?>(_colorTween.value),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Get.offNamed('login');
    // Get.offNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onestop_logo.png',
              height: screenHeight * 0.90, 
            ),
            SizedBox(height: screenHeight * 0.03),  // 3% of screen height
            // const CircularProgressIndicator(),  // Simple CircularProgressIndicator without animation

          ],
        ),
      ),
    );
  }
}
