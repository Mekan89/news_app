import 'package:dio/dio.dart';
import 'package:news_app/models%20/article_model.dart';

class FetchNews {
  List<ArticleModel> news = [];

  Future<void> fetchNews([String? category]) async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=in${category != null ? '&category=$category' : ''}&apiKey=6b75796297ae4fbdaf0a14d8eb9b91d7';

      final response = await Dio().get(url);
      final jsonData = response.data;

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null &&
              element['description'] != null &&
              element['content'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'] ?? "Anonymous",
              title: element['title'] ?? 'Anonymous',
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );

            news.add(articleModel);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
