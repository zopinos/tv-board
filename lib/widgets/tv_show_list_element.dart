import 'package:flutter/material.dart';
import 'package:tv_program_manager/models/tv_show.dart';

class TvShowListElement extends StatelessWidget {
  const TvShowListElement({required this.tvShow, super.key});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: Card(
        child: ListTile(
          leading: Text(tvShow.channel),
          title: Text(tvShow.title),
          subtitle: Text("Time here"),
        ),
      ),
    );
  }
}


/* Get.toNamed(
                            Destinations.showsEdit.replaceFirst(
                              ':showId',
                              show.id,
                            ),
                          ); */