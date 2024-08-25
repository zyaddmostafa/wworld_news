import 'package:flutter/material.dart';
import 'package:uworld_news/models/article_model.dart';
import 'package:uworld_news/widgets/news_card.dart';

class NewsCardlist extends StatelessWidget {
  const NewsCardlist(
      {super.key,
      required this.articleModel,
      required this.height,
      required this.email});
  final List<ArticleModel> articleModel;
  final double height;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: articleModel.length,
        itemBuilder: (context, index) {
          return NewsCard(
            articleModel: articleModel[index],
            email: email,
          );
        },
      ),
    );
  }
}
