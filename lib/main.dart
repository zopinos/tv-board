import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tv_program_manager/controllers/base_controller.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/pages/analytics/analytics_page.dart';
import 'package:tv_program_manager/pages/home/home_page.dart';
import 'package:tv_program_manager/pages/shows/show_edit_page.dart';
import 'package:tv_program_manager/pages/shows/shows_add_page.dart';
import 'package:tv_program_manager/pages/shows/shows_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.put(BaseController());
  Get.lazyPut<TvShowController>(() => TvShowController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/shows", page: () => ShowsPage()),
        GetPage(name: "/shows/add", page: () => ShowsAddPage()),
        //GetPage(name: "/shows/:showId", page: () => ShowDetailPage()),
        GetPage(name: "/shows/:showId/edit", page: () => ShowEditPage()),
        GetPage(name: "/analytics", page: () => AnalyticsPage()),
      ],
    );
  }
}
