import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/constants/navigation_ids.dart';
import 'package:tv_program_manager/widgets/tv_show_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Get.toNamed(Destinations.homeAddShow, id: NavigationIds.home),
              child: const Icon(Icons.add),
            ),
            TvShowList(),
          ],
        ),
      ),
    );
  }
}
