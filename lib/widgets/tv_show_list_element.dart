import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/constants/destinations.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/utils/formatter.dart';

class TvShowListElement extends StatelessWidget {
  const TvShowListElement({required this.tvShow, super.key});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: Card(
        child: InkWell(
          onTap: () => {
            Get.toNamed(
              Destinations.showsEdit.replaceFirst(':showId', tvShow.id),
            ),
          },
          child: ListTile(
            mouseCursor: SystemMouseCursors.click,
            leading: Text(
              "${dateFormatter.format(tvShow.startDateTime)}\n${timeFormatter.format(tvShow.startDateTime)} - ${timeFormatter.format(tvShow.endDateTime)}    ${tvShow.endDateTime.difference(tvShow.startDateTime).inMinutes} min",
            ),
            title: Text(tvShow.title),
            subtitle: Row(
              children: [
                Icon(Icons.tv, color: Colors.white70),
                Container(
                  margin: EdgeInsets.only(left: Margins.compactMargin),
                  child: Text(tvShow.channel),
                ),
              ],
            ),
            titleTextStyle: TextStyle(
              fontSize: FontSizes.lg,
              color: Colors.white,
            ),
            subtitleTextStyle: TextStyle(
              fontSize: FontSizes.base,
              color: Colors.white70,
            ),
            leadingAndTrailingTextStyle: TextStyle(
              fontSize: FontSizes.base,
              color: Colors.white,
            ),
            visualDensity: VisualDensity.standard,
          ),
        ),
      ),
    );
  }
}
