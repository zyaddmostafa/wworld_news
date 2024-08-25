import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/models/article_model.dart';

class SpecificnewsView extends StatelessWidget {
  const SpecificnewsView({super.key});
  static String id = kspecificview;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.bookmark)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(args.image ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'The latest situation in this topic',
              style: const TextStyle(fontSize: 24),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                FontAwesomeIcons.arrowDown,
                color: kcolor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 295),
                  child: Text(
                    'Title :',
                    style: TextStyle(color: kcolor, fontSize: 25),
                  ),
                ),
                Text(
                  args.title,
                  style: const TextStyle(color: kcolor3, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'description :',
                    style: TextStyle(color: kcolor, fontSize: 25),
                  ),
                ),
                Text(
                  args.desc ?? 'There is no description for that topic',
                  style: const TextStyle(color: kcolor3, fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
