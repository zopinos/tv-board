import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/widgets/base_page.dart';
import 'package:tv_program_manager/widgets/tv_show_input.dart';

class ShowEditPage extends StatelessWidget {
  const ShowEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showId = Get.parameters["showId"] ?? "";
    final showToEdit = Get.find<TvShowController>().getShowById(showId);
    return BasePage(
      title: 'Edit TV Show',
      body: Center(child: TvShowInput(showToEdit: showToEdit)),
    );
  }
}
