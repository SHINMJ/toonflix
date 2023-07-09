import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_category.dart';
import 'package:movieflix/models/movies.dart';
import 'package:movieflix/services/api.dart';
import 'package:movieflix/widgets/movie_card.dart';

class MovieList extends StatefulWidget {
  final MovieCategory category;

  const MovieList({super.key, required this.category});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Movies>> movies;

  @override
  void initState() {
    super.initState();
    setState(() {
      movies = ApiService.getMovies(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Column buildListView(AsyncSnapshot<List<Movies>> snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return MovieCard(
                  movie: movie,
                  isShowTitle: widget.category != MovieCategory.popular,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: snapshot.data!.length),
        ),
      ],
    );
  }
}
