import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/widgets/bookmark_articlebuilder.dart';
import 'package:uworld_news/widgets/custom_title.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});
  static String id = kBookmarkNodata;

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    log(email.toString());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          const CustomTitle(
              subtitlepadding: 145,
              titlepadding: 240,
              title: 'Bookmarks',
              subtitle: 'Saved articles to the library '),
          BookmarkArticlebuilder(
            email: email.toString(),
          ),
        ],
      ),
    );
  }
}
