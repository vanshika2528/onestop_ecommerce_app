import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageController extends GetxController {
  Rxn<File> selectedImage = Rxn<File>();
  RxString selectedImageSize = ''.obs;


  Future<void> pickImageFromGallery() async {
    pickImage(ImageSource.gallery);
  }

  Future<void> pickImageFromCamera() async {
    pickImage(ImageSource.camera);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);

    if (image != null) {
      selectedImage.value = File(image.path);
      selectedImageSize.value = ((selectedImage.value!.lengthSync() / 1024 / 1024).toStringAsFixed(2)) + " MB";
      print("Image selected");
      // Get.to(() => ProfileScreen(), arguments: selectedImage.value);
      Get.offNamed('profile');
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}