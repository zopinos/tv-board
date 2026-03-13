import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/widgets/base_page.dart';
import 'package:tv_program_manager/widgets/tv_show_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final tvShowController = Get.find<TvShowController>();

  @override
  Widget build(BuildContext context) {
    final nextTvShow = tvShowController.getNextStartingShow();

    return BasePage(
      title: 'Home',
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(Margins.defaultMargin),
                child: const Text(
                  "Next Up",
                  style: TextStyle(
                    fontSize: FontSizes.xl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            nextTvShow == null
                ? Text("The next airing TV show will be shown here")
                : TvShowWidget(tvShow: nextTvShow),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(Margins.defaultMargin),
                child: const Text(
                  "General Analytics",
                  style: TextStyle(
                    fontSize: FontSizes.xl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
