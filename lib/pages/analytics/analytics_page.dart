import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/utils/formatter.dart';
import 'package:tv_program_manager/widgets/base_page.dart';

class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({super.key});

  final tvShowController = Get.find<TvShowController>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Analytics',
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(Margins.defaultMargin),
                child: const Text(
                  "Analytics",
                  style: TextStyle(
                    fontSize: FontSizes.xl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              'Total length of saved TV shows: ${tvShowController.getTotalLength().toString()} mins',
            ),
            Text(
              "Average length of a TV show: ${tvShowController.averageLengthOfTvShows().toInt().toString()} mins",
            ),
            Text(
              "Favourite TV channel: ${tvShowController.getFavouriteChannel()}",
            ),
            Text(
              "Earliest TV show start time: ${tvShowController.earliestStartTime() != null ? formatDateTime(tvShowController.earliestStartTime()!) : "No TV shows added"}",
            ),
            Text(
              "Latest TV show start time: ${tvShowController.latestStartTime() != null ? formatDateTime(tvShowController.latestStartTime()!) : "No TV shows added"}",
            ),
          ],
        ),
      ),
    );
  }
}
