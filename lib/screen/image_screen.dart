import 'package:onestop/controllers/imagepicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerScreen extends StatelessWidget {
  final ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color.fromARGB(255, 44, 27, 174),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              return controller.selectedImage.value == null
                  ? Text('No image selected.')
                  : Expanded(
            child: Container(
              margin: EdgeInsets.all(10), // Add some margin around the image if needed
              child: ClipRRect(
               borderRadius: BorderRadius.circular(40), // This makes the image round
                child: Image.file(
                  controller.selectedImage.value!,
                  fit: BoxFit.cover, // This makes the image cover the entire space of the container
                ), 
              ),
            ),
          );
        }),
          SizedBox(height: 5),
         Obx((){
          return  controller.selectedImage.value == null
                  ? Text('')
                  :Text('Size: ${controller.selectedImageSize.value}');
         }),
            SizedBox(height: 20),
           ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10, // This sets the elevation of the button
                ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return SafeArea(
                      child: Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.photo_library),
                              title: new Text('Gallery'),
                              onTap: () {
                                controller.pickImageFromGallery();
                                Navigator.of(context).pop();
                              }
                            ),
                            new ListTile(
                              leading: new Icon(Icons.photo_camera),
                              title: new Text('Camera'),
                              onTap: () {
                                controller.pickImageFromCamera();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
              child: Text('Pick Image',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}