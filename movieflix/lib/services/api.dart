import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/detail.dart';
import 'package:movieflix/models/movie_category.dart';
import 'package:movieflix/models/movies.dart';
import 'package:movieflix/utils/utility.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String commingSoon = 'comming-soon';
  static const String movieInfo = 'movie';

  static Future<List<Movies>> getMovies(MovieCategory category) async {
    if (category == MovieCategory.popular) {
      return await _get(popular);
    }
    if (category == MovieCategory.nowPlaying) {
      return await _get(nowPlaying);
    }
    if (category == MovieCategory.commingSoon) {
      return await _get(commingSoon);
    }
    throw Error();
  }

  static Future<List<Movies>> _get(String endpoints) async {
    List<Movies> moviesInstances = [];

    final response = await http.get(Utility.parseUri('$baseUrl/$popular'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> info = jsonDecode(response.body);
      final List<dynamic> movies = info['results'];
      for (var json in movies) {
        final movie = Movies.fromJson(json);
        moviesInstances.add(movie);
      }

      return moviesInstances;
    }

    throw Error();
  }

  static Future<MovieDetail> getMovieById(int id) async {
    final response =
        await http.get(Utility.parseUri('$baseUrl/$movieInfo?id=$id'));

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetail.fromJson(movie);
    }

    throw Error();
  }
}
