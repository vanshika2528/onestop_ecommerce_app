import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestop/controllers/login_controller.dart';

class PaymentOptionsPage extends StatelessWidget {
  final selectedPayment = ''.obs;
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
            title: Text('Payment',
               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent, // Make it transparent to show the gradient
            elevation: 0, // Remove shadow
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
             color: Colors.grey.shade300,  // Set the container color to yellow
             child:const Padding(
               padding: EdgeInsets.all(8.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Bank Offer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('10% Instant Discount on SBI Credit Card and Credit Card EMI transactions on min. spend of ₹3,500. TCA'),
                ],
              ),
             ),
            ),
             SizedBox(height: 20),
              Text('Recommended Payment Options', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => ListTile(
              title: const Text('Cash on Delivery (Cash/UPI)'),
              leading: Radio(
                value: 'cash',
                groupValue: selectedPayment.value,
                onChanged: (value) {
                  selectedPayment.value = value!;
                },
              ),
            )),
            Obx(() => ListTile(
              title: const Text('Google Pay'),
              leading: Radio(
                value: 'google_pay',
                groupValue: selectedPayment.value,
                onChanged: (value) {
                  selectedPayment.value = value!;
                },
              ),
            )),
            SizedBox(height: 20),
            Text('Other Payment Options', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => ListTile(
              title: const Text('UPI (Pay via any App)'),
              leading: Radio(
                value: 'upi',
                groupValue: selectedPayment.value,
                onChanged: (value) {
                  selectedPayment.value = value!;
                },
              ),
            )),
            Obx(() => ListTile(
              title: const Text('Credit/Debit Card'),
              leading: Radio(
                value: 'card',
                groupValue: selectedPayment.value,
                onChanged: (value) {
                  selectedPayment.value = value!;
                },
              ),
            )),
            Obx(() => ListTile(
              title: const Text('Wallets'),
              leading: Radio(
                value: 'wallets',
                groupValue: selectedPayment.value,
                onChanged: (value) {
                  selectedPayment.value = value!;
                },
              ),
            )),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10), // Added rounded corners to the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children to both ends
                children: [
                  Text(' ₹ 7,935', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      Get.snackbar('Payment Successful', 'Thank you for shopping with us.',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    },
                    child: Text('PAY NOW', style: TextStyle(fontSize: 18, 
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 60, 93),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5, // Adds shadow to the button
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
