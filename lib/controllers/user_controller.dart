import 'package:get/get.dart';

class UserController extends GetxController {
  var username = 'John'.obs;

  void setUsername(String name) {
    username.value = name;
  }
}