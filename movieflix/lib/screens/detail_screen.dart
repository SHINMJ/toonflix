import 'package:flutter/material.dart';
import 'package:movieflix/models/detail.dart';
import 'package:movieflix/services/api.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String poster;
  final String title;

  const DetailScreen(
      {super.key, required this.id, required this.poster, required this.title});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetail> movie;

  @override
  void initState() {
    super.initState();
    setState(() {
      movie = ApiService.getMovieById(widget.id);
    });
  }

  void onPressedBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('${ApiService.imageBaseUrl}/${widget.poster}'),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onPressedBack,
                  icon: const Icon(Icons.chevron_left),
                  color: Colors.white,
                  iconSize: 35,
                ),
                const Text(
                  'Back to list',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 300,
            ),
            FutureBuilder(
              future: movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var stars = snapshot.data!.numberOfStars();
                  var totalStars = stars.floor();
                  bool halfStar = (stars - totalStars) < 0.5 ? false : true;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            for (var i = 1; i <= 5; i++)
                              Icon(
                                i <= totalStars
                                    ? Icons.star_rounded
                                    : i == totalStars + 1
                                        ? halfStar
                                            ? Icons.star_half_rounded
                                            : Icons.star_border_rounded
                                        : Icons.star_border_rounded,
                                color: Colors.yellow,
                                size: 30,
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.runtimeWithGenre(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Storyline",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          snapshot.data!.overview,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.yellow,
                              fixedSize: const Size(300, 70),
                            ),
                            child: const Text(
                              'Buy ticket',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
