import 'package:flutter/material.dart';
import 'package:uworld_news/models/saved_article.dart';
import 'package:uworld_news/widgets/articale_card.dart';
import 'package:uworld_news/widgets/bookmark_nodata.dart';

class Articlebuilder extends StatefulWidget {
  const Articlebuilder({
    super.key,
    required this.articlelist,
    required this.email,
  });
  final String email;
  final List<SavedArticle> articlelist;

  @override
  State<Articlebuilder> createState() => _ArticlebuilderState();
}

class _ArticlebuilderState extends State<Articlebuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 588,
      child: ListView.builder(
        itemCount: widget.articlelist.length,
        itemBuilder: (context, index) {
          return (widget.articlelist[index].email == widget.email)
              ? ArticaleCard(
                  savedArticle: widget.articlelist[index],
                )
              : const SizedBox(
                  height: 1,
                );
        },
      ),
    );
  }
}
