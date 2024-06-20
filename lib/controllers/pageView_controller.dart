import 'package:get/get.dart';

class PageViewController extends GetxController {
  var showPageView = true.obs;

  void togglePageView(bool isVisible) {
    showPageView.value = isVisible;
  }
}
