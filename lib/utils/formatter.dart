import 'package:intl/intl.dart';
import 'package:tv_program_manager/models/tv_show.dart';

final DateFormat timeFormatter = DateFormat("HH:mm");
final DateFormat dateFormatter = DateFormat("dd/MM/yyyy");

String tvShowDate(TvShow tvShow) {
  return dateFormatter.format(tvShow.startDateTime);
}

String tvShowTime(TvShow tvShow) {
  return "${timeFormatter.format(tvShow.startDateTime)} - ${timeFormatter.format(tvShow.endDateTime)}";
}

String tvShowLength(TvShow tvShow) {
  return "${tvShow.endDateTime.difference(tvShow.startDateTime).inMinutes} min";
}
