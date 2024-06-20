import 'dart:convert';
import 'package:onestop/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController{

  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final UserController userController = Get.put(UserController()); 
  RxBool loading = false.obs;
  RxString username = ''.obs;

  void loginApi() async{

    try{
    loading.value=true;
        final response = await http.post(Uri.parse('https://dummyjson.com/auth/login'),

        // final response = await http.post(Uri.parse('https://mocki.io/v1/3f84f270-b1a0-4787-9122-44a2ddcbf515'),
        body:jsonEncode({
          'username':nameController.value.text,
          'password':passwordController.value.text,
        },),
            headers: {'Content-Type': 'application/json'},
      );
           
         var data = jsonDecode(response.body);
                   print(data);
             print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            
            if(response.statusCode == 200){
              loading.value=false;
               username.value = data['username'];
                 Get.back();
                  Get.snackbar('Login Successfull','Welcome ${username.value}',
                  colorText: Colors.white,
                  backgroundColor: Colors.green,);
                    userController.setUsername(username.value);
                  Get.toNamed('home');
            }else{
              loading.value = false;
                Get.snackbar('Login Failed','please enter correct password',
                 colorText: Colors.white,
                  backgroundColor: Colors.red,);
                     Get.toNamed('home');
            }
      }catch(e){
        loading.value = false;
            Get.snackbar('Exception', e.toString(),
             colorText: Colors.white,
                  backgroundColor: Colors.red,);
      }
  }

  void clearCredentials() {
  nameController.value.clear();
  passwordController.value.clear();
     }
}