import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  /// 비동기 프로그래밍
  /// async - await
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> wetoons = jsonDecode(response.body);

      for (var json in wetoons) {
        final toon = WebtoonModel.fromJson(json);
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    }
    throw Error();
  }
}
