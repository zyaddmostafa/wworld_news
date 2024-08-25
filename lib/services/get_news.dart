import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:uworld_news/models/article_model.dart';

class NewsService {
  final dio = Dio();
  final apiky = '1517fd72fc7419efcaaae6e0ca7d18ac';
  final domianname = '//gnews.io/api/v4/top-headlines?lang=en&';
  Future<List<ArticleModel>> getnews({required String categoryname}) async {
    Response response =
        await dio.get('https:$domianname&category=$categoryname&apikey=$apiky');
    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = response.data;
      List<dynamic> articles = responsedata['articles'];
      List<ArticleModel> articlelist = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      log('Dio error');
      return [];
    }
  }
}
