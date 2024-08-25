import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/views/bookmark_view.dart';
import 'package:uworld_news/views/category_view.dart';
import 'package:uworld_news/views/news_view.dart';
import 'package:uworld_news/views/profile_view.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    this.email = '',
  });
  final Color color = kcolor;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: kcolor3.withOpacity(0.03),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                color: color,
                onPressed: () {
                  Navigator.pushNamed(context, NewsView.id);
                },
                icon: const Icon(FontAwesomeIcons.house)),
            IconButton(
                color: color,
                onPressed: () {
                  Navigator.pushNamed(context, CategoryView.id);
                },
                icon: const Icon(Icons.list, size: 30)),
            IconButton(
                color: color,
                onPressed: () {
                  Navigator.pushNamed(context, BookmarkView.id,
                      arguments: email);
                },
                icon: const Icon(FontAwesomeIcons.bookmark)),
            IconButton(
                color: color,
                onPressed: () {
                  Navigator.pushNamed(context, ProfileView.id,
                      arguments: email);
                },
                icon: const Icon(FontAwesomeIcons.user)),
          ],
        ),
      ),
    );
  }
}
