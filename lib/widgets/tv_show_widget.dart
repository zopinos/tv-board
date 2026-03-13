import 'package:flutter/material.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/styling/typography.dart';
import 'package:tv_program_manager/utils/formatter.dart';

class TvShowWidget extends StatelessWidget {
  final TvShow tvShow;

  const TvShowWidget({required this.tvShow, super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainer,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(Margins.defaultMargin),
              child: Text(
                tvShow.title,
                style: TextStyle(
                  fontSize: FontSizes.lg,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                left: Margins.defaultMargin,
                bottom: Margins.defaultMargin,
              ),
              child: Text(
                "${tvShowDate(tvShow)}\n${tvShowTime(tvShow)}  (${tvShowLength(tvShow)})",
                style: TextStyle(fontSize: FontSizes.base),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                left: Margins.defaultMargin,
                bottom: Margins.defaultMargin,
              ),
              child: Text(
                "On channel: ${tvShow.channel}",
                style: TextStyle(fontSize: FontSizes.base),
              ),
            ),
          ),
          tvShow.description == ""
              ? Container()
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(Margins.defaultMargin),
                    child: Text(
                      "Description:\n${tvShow.description}",
                      style: TextStyle(fontSize: FontSizes.base),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
