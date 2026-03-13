import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/widgets/tv_show_list_element.dart';

class TvShowList extends StatelessWidget {
  TvShowList({super.key});

  final tvShowController = Get.find<TvShowController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tvShowController.size == 0
          ? Text('No shows added yet')
          : Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: Paddings.defaultPadding,
                ),
                scrollDirection: Axis.vertical,
                children: tvShowController.shows
                    .map((show) => TvShowListElement(tvShow: show))
                    .toList(),
              ),
            ),
    );
  }
}
