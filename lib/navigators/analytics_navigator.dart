import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/constants/navigation_ids.dart';
import 'package:tv_program_manager/pages/analytics/analytics_page.dart';

class AnalyticsNavigator extends StatelessWidget {
  const AnalyticsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavigationIds.analytics),
      onGenerateRoute: (settings) {
        if (settings.name == Destinations.analytics) {
          return GetPageRoute(settings: settings, page: () => AnalyticsPage());
        } else {
          return GetPageRoute(settings: settings, page: () => AnalyticsPage());
        }
      },
    );
  }
}
