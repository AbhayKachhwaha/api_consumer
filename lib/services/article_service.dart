import 'package:api_consumer/models/Article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  static Future<List<Article>?> getArticles() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://cors-anywhere.herokuapp.com/https://articles-fetcher.herokuapp.com/article/abc');
    var response = await client.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });

    if (response.statusCode == 200) {
      var json = response.body;
      return articleFromJson(json);
    } else {
      return [];
    }
  }
}
