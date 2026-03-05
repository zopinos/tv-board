import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/widgets/base_page.dart';
import 'package:tv_program_manager/widgets/tv_show_list.dart';

class ShowsPage extends StatelessWidget {
  const ShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Shows',
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Destinations.showsAdd),
              child: const Icon(Icons.add),
            ),
            TvShowList(),
          ],
        ),
      ),
    );
  }
}
