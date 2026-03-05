import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/constants/navigation_ids.dart';
import 'package:tv_program_manager/pages/home/home_add_show_page.dart';
import 'package:tv_program_manager/pages/home/home_edit_show_page.dart';
import 'package:tv_program_manager/pages/home/home_page.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavigationIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == Destinations.homeAddShow) {
          return GetPageRoute(
            settings: settings,
            page: () => const HomeAddShowPage(),
          );
        }
        if (settings.name == Destinations.homeEditShow) {
          return GetPageRoute(
            settings: settings,
            page: () => const HomeEditShowPage(),
          );
        } else {
          return GetPageRoute(settings: settings, page: () => const HomePage());
        }
      },
    );
  }
}
