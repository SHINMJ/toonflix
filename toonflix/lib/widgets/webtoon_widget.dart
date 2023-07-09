import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => DetailScreen(title: title, thumb: thumb, id: id),
              fullscreenDialog: true,
            ),
        );
      },
      child: Column(
        children: [
          Hero(
              tag: id,
              child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              child: Image.network(
                thumb,
                /// 403 에러 -> user-agent를 변경한다. 네이버 웹툰 이미지를 가져오는 실습에서 네이버가 차단하는 것 같음.
                /// https://gist.github.com/preinpost/941efd33dff90d9f8c7a208da40c18a9
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
