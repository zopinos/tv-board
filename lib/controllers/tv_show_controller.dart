import 'package:tv_program_manager/models/tv_show.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';

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

  int getTotalLength() {
    return tvShows
        .map(
          (tvShow) =>
              tvShow.endDateTime.difference(tvShow.startDateTime).inMinutes,
        )
        .sum;
  }

  double averageLengthOfTvShows() {
    if (tvShows.isEmpty) {
      return 0;
    }
    return getTotalLength() / tvShows.length;
  }

  DateTime? earliestStartTime() {
    if (tvShows.isEmpty) return null;
    TvShow? earliestTvShow = minBy(tvShows, (tvShow) => tvShow.startDateTime);
    return earliestTvShow!.startDateTime;
  }

  DateTime? latestStartTime() {
    if (tvShows.isEmpty) return null;
    TvShow? earliestTvShow = maxBy(tvShows, (tvShow) => tvShow.startDateTime);
    return earliestTvShow!.startDateTime;
  }

  String getFavouriteChannel() {
    if (tvShows.isEmpty) return "none";

    var channelCounts = {};

    for (var tvShow in tvShows) {
      if (!channelCounts.containsKey(tvShow.channel)) {
        channelCounts[tvShow.channel] = 1;
      } else {
        channelCounts[tvShow.channel] += 1;
      }
    }

    var list = channelCounts.entries
        .map((channel) => [channel.key, channel.value])
        .toList();
    list.sort((a, b) => b[1].compareTo(a[1]));

    return list[0][0];
  }
}
