import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  var currentIndex = 0.obs;

  final destinations = [
    Destinations.home,
    Destinations.shows,
    Destinations.analytics,
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offAllNamed(destinations[index]);
  }
}
