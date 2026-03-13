import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/widgets/base_page.dart';
import 'package:tv_program_manager/widgets/tv_show_list.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BasePage(
      title: 'TV Shows',
      body: Column(
        children: [
          screenSize.width < Breakpoints.tablet
              ? Container()
              : Container(
                  margin: EdgeInsets.all(Margins.defaultMargin),
                  child: ElevatedButton.icon(
                    onPressed: () => Get.toNamed(Destinations.showsAdd),
                    icon: const Icon(Icons.add),
                    label: const Text("Add TV show"),
                  ),
                ),
          screenSize.width < Breakpoints.tablet
              ? Container()
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(Margins.defaultMargin),
                    child: Text(
                      "TV Shows",
                      style: TextStyle(
                        fontSize: FontSizes.xl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

          TvShowList(),
        ],
      ),
    );
  }
}
