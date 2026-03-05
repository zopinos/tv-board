import 'package:tv_program_manager/models/tv_show.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class TvShowController {
  final storage = Hive.box("storage");

  final RxList<TvShow> shows = <TvShow>[].obs;

  TvShowController() {
    final storedShows = storage.get('shows');

    if (storedShows == null) {
      storage.put('shows', []);
    } else {
      shows.value = (storedShows as List)
          .map((show) => TvShow.fromJson(show))
          .toList();
    }
  }

  void _save() {
    storage.put('shows', shows.map((show) => show.toJson()).toList());
  }

  void add(TvShow show) {
    shows.add(show);
    _save();
  }

  void update(TvShow show) {
    shows.firstWhere((element) => element.id == show.id).replaceWith(show);
    shows.refresh();
    _save();
  }

  void delete(TvShow show) {
    shows.remove(show);
    shows.refresh();
    _save();
  }

  get size => shows.length;
}
