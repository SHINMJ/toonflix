import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_category.dart';
import 'package:movieflix/models/movies.dart';
import 'package:movieflix/services/api.dart';
import 'package:movieflix/widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Movies>> movies = ApiService.getMovies(MovieCategory.commingSoon);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategoryTitle('Popular Movies'),
            const Flexible(
              flex: 2,
              child: MovieList(category: MovieCategory.popular,),
            ),
            buildCategoryTitle('Now in Cinemas'),
            const Flexible(
              flex: 2,
              child: MovieList(category: MovieCategory.nowPlaying,),
            ),
            buildCategoryTitle('Coming soon'),
            const Flexible(
              flex: 2,
              child: MovieList(category: MovieCategory.commingSoon,),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
