import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/widgets/base_page_mobile.dart';
import 'package:tv_program_manager/widgets/tv_show_list.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageMobile(
      title: 'TV Shows',
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Destinations.showsAdd),
              child: const Icon(Icons.add),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(Margins.defaultMargin),
              child: Text(
                "TV Shows",
                style: TextStyle(
                  fontSize: FontSizes.lg,
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
