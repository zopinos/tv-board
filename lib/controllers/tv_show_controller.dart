import 'package:tv_program_manager/models/tv_show.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class TvShowController {
  final storage = Hive.box("storage");

  final RxList<TvShow> tvShows = <TvShow>[].obs;

  TvShowController() {
    final storedShows = storage.get('tvShows');

    if (storedShows == null) {
      storage.put('tvShows', []);
    } else {
      tvShows.value = (storedShows as List)
          .map((tvShow) => TvShow.fromJson(tvShow))
          .toList();
      _removeEnded();
      _sort();
    }
  }

  void _save() {
    storage.put('tvShows', tvShows.map((tvShow) => tvShow.toJson()).toList());
  }

  void add(TvShow tvShow) {
    tvShows.add(tvShow);
    _removeEnded();
    _sort();
    _save();
  }

  void update(TvShow updatedTvShow) {
    tvShows
        .firstWhere((tvShow) => tvShow.id == updatedTvShow.id)
        .replaceWith(updatedTvShow);
    _removeEnded();
    _sort();
    tvShows.refresh();
    _save();
  }

  TvShow? getShowById(String id) {
    try {
      return tvShows.firstWhere((tvShow) => tvShow.id == id);
    } catch (e) {
      return null;
    }
  }

  TvShow? getNextStartingShow() {
    try {
      return tvShows.first;
    } catch (e) {
      return null;
    }
  }

  void delete(TvShow tvShow) {
    tvShows.remove(tvShow);
    tvShows.refresh();
    _save();
  }

  void _removeEnded() {
    tvShows.removeWhere(
      (tvShow) => tvShow.endDateTime.isBefore(DateTime.now()),
    );
  }

  void _sort() {
    tvShows.sort((a, b) => a.startDateTime.compareTo(b.startDateTime));
  }

  int get size => tvShows.length;
}
