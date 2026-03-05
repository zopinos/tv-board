import 'package:get/get.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
