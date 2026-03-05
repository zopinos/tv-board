import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/base_controller.dart';

class TvBottomNavigationBar extends StatelessWidget {
  const TvBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        selectedIndex: BaseController.to.currentIndex.value,
        onDestinationSelected: (index) => BaseController.to.changePage(index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics, color: Colors.white),
            label: "Analytics",
          ),
        ],
      ),
    );
  }
}
