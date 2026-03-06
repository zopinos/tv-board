class TvShow {
  final String id;
  String title;
  String channel;
  DateTime startDateTime;
  DateTime endDateTime;
  String description;

  TvShow({
    required this.id,
    required this.title,
    required this.channel,
    required this.startDateTime,
    required this.endDateTime,
    required this.description,
  });

  Map toJson() => {
    'id': id,
    'title': title,
    'channel': channel,
    'startDateTime': startDateTime,
    'endDateTime': endDateTime,
    'description': description,
  };

  factory TvShow.fromJson(Map json) {
    return TvShow(
      id: json['id'],
      title: json['title'],
      channel: json['channel'],
      startDateTime: DateTime.parse(json['startDateTime']),
      endDateTime: DateTime.parse(json['endDateTime']),
      description: json['description'],
    );
  }

  void replaceWith(TvShow other) {
    if (id != other.id) {
      throw ArgumentError('IDs must match to replace a TV show');
    }
    title = other.title;
    channel = other.channel;
    startDateTime = other.startDateTime;
    endDateTime = other.endDateTime;
    description = other.description;
  }
}
