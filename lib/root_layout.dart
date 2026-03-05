import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tv_program_manager/controllers/base_controller.dart';
import 'package:tv_program_manager/tv_bottom_navigation_bar.dart';
import 'package:tv_program_manager/navigators/home_navigator.dart';
import 'package:tv_program_manager/navigators/analytics_navigator.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: BaseController.to.currentIndex.value,
          children: const [HomeNavigator(), AnalyticsNavigator()],
        ),
      ),
      bottomNavigationBar: TvBottomNavigationBar(),
    );
  }
}
