class TvShow {
  final String id;
  String title;
  //final String description;
  //final DateTime date;
  String channel;

  TvShow(this.id, this.title, this.channel);

  Map toJson() => {'id': id, 'title': title, 'channel': channel};

  factory TvShow.fromJson(Map json) {
    return TvShow(json['id'], json['title'], json['channel']);
  }

  void replaceWith(TvShow other) {
    if (id != other.id) {
      throw ArgumentError('IDs must match to replace a TV show');
    }
    title = other.title;
    channel = other.channel;
  }
}
