import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/models/saved_article.dart';

class ArticaleCard extends StatelessWidget {
  const ArticaleCard({super.key, required this.savedArticle});
  final SavedArticle savedArticle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                savedArticle.image ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                height: 120,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      savedArticle.title.substring(0, 50),
                      style: const TextStyle(color: kcolor3, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      savedArticle.desc,
                      style: const TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 115,
            ),
          ],
        ),
      ),
    );
  }
}
