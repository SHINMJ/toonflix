import 'package:flutter/material.dart';
import 'package:movieflix/models/movies.dart';
import 'package:movieflix/screens/detail_screen.dart';
import 'package:movieflix/services/api.dart';

class MovieCard extends StatelessWidget {
  final Movies movie;
  final bool isShowTitle;

  const MovieCard({super.key, required this.movie, this.isShowTitle = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailScreen(id: movie.id, poster: movie.poster, title: movie.title,),
            fullscreenDialog: true,
          )
        );
      },
      child: SizedBox(
        width: isShowTitle ? 150 : 300,
        height: isShowTitle ? 200 : 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${ApiService.imageBaseUrl}/${movie.poster}',
                fit: BoxFit.fill,
                width: isShowTitle ? 150 : 300,
                height: isShowTitle ? 150 : 200,
              ),
            ),
            isShowTitle
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
