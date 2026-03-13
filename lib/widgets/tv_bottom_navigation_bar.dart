import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/navigation_controller.dart';

class TvBottomNavigationBar extends StatelessWidget {
  const TvBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        elevation: 0,
        animationDuration: Duration.zero,
        selectedIndex: NavigationController.to.currentIndex.value,
        onDestinationSelected: (index) =>
            NavigationController.to.changePage(index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_outlined),
            selectedIcon: Icon(Icons.tv, color: Colors.white),
            label: "TV Shows",
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
