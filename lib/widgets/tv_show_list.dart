import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';

class TvShowList extends StatelessWidget {
  final tvShowController = Get.find<TvShowController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tvShowController.size == 0
          ? Text('No shows added yet')
          : Column(
              children: tvShowController.shows
                  .map(
                    (show) => ListTile(
                      title: Text(show.title),
                      leading: Text(show.channel),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.toNamed(
                            Destinations.showsEdit.replaceFirst(
                              ':showId',
                              show.id,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
