import 'package:get/get.dart';

class LengthController extends GetxController {
  RxBool hasError = false.obs;

  void setState(bool value) {
    hasError.value = value;
  }
}
