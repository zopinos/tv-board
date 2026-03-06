import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/controllers/length_controller.dart';
import 'package:tv_program_manager/controllers/navigation_controller.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/pages/analytics/analytics_page.dart';
import 'package:tv_program_manager/pages/home/home_page.dart';
import 'package:tv_program_manager/pages/shows/show_edit_page.dart';
import 'package:tv_program_manager/pages/shows/shows_add_page.dart';
import 'package:tv_program_manager/pages/shows/shows_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.put(NavigationController());
  Get.put(TvShowController());
  Get.lazyPut<LengthController>(() => LengthController(), fenix: true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      initialRoute: Destinations.home,
      getPages: [
        GetPage(name: Destinations.home, page: () => HomePage()),
        GetPage(name: Destinations.shows, page: () => ShowsPage()),
        GetPage(name: Destinations.showsAdd, page: () => ShowsAddPage()),
        //GetPage(name: Destinations.showsDetail, page: () => ShowDetailPage()),
        GetPage(name: Destinations.showsEdit, page: () => ShowEditPage()),
        GetPage(name: Destinations.analytics, page: () => AnalyticsPage()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
