class Movies {
  final int id;
  final String poster;
  final String title;

  Movies.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster = json['poster_path'],
        title = json['title'];

  @override
  String toString() {
    return "id=$id, title=$title, poster=$poster";
  }
}
