import 'package:movieflix/models/genre.dart';

class MovieDetail {
  final int id;
  final String poster;
  final String title;
  final int runtime;
  final String overview;
  final double voteAverage;
  final List<Genre> genres;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster = json['poster_path'],
        title = json['title'],
        runtime = json['runtime'],
        overview = json['overview'],
        voteAverage = json['vote_average'],
        genres = convertJsonToGenres(json['genres']);

  static List<Genre> convertJsonToGenres(List<dynamic> json) {
    List<Genre> list = [];
    for (var genre in json) {
      list.add(Genre.fromJson(genre));
    }
    return list;
  }

  String runtimeWithGenre() {
    return '${_minuteToHourMin(runtime)} | ${_genreNames()}';
  }

  double numberOfStars() {
    return voteAverage / 2;
  }

  String _genreNames() {
    return genres.join(",");
  }

  String _minuteToHourMin(int min) {
    var duration = Duration(minutes: min);
    var end = duration.toString().lastIndexOf(":");
    return duration
        .toString()
        .substring(0, end + 1)
        .replaceFirst(":", "h ")
        .replaceAll(":", "min");
  }
}
