import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uworld_news/models/saved_article.dart';
import 'package:uworld_news/widgets/article_listbuilder.dart';
import 'package:uworld_news/widgets/bookmark_nodata.dart';

class BookmarkArticlebuilder extends StatelessWidget {
  const BookmarkArticlebuilder({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersavednews = FirebaseFirestore.instance
        .collection('user saved articles')
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _usersavednews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SavedArticle> articlelist = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            articlelist.add(SavedArticle.fromjson(snapshot.data!.docs[i]));
          }
          return articlelist.isNotEmpty
              ? Articlebuilder(
                  articlelist: articlelist,
                  email: email,
                )
              : const BookmarkNodata();
        } else if (snapshot.hasError) {
          log('error snapshot ');
          return const Text(' there was an error');
        } else {
          return const SizedBox(
            height: 588,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
