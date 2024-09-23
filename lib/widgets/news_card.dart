import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/image_method.dart';
import 'package:uworld_news/models/article_model.dart';
import 'package:uworld_news/views/bookmark_view.dart';
import 'package:uworld_news/views/favtopics_view.dart';
import 'package:uworld_news/views/specificnews_view.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key, required this.articleModel, required this.email});
  final ArticleModel articleModel;
  final String email;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  CollectionReference usersaved =
      FirebaseFirestore.instance.collection('user saved articles');
  bool isactive = false;
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SpecificnewsView.id,
            arguments: widget.articleModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          elevation: 1.5,
          color: kcolor2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: getImage(image: widget.articleModel.image)),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 7),
                child: Text(
                  widget.articleModel.title,
                  style: const TextStyle(fontSize: 20, color: kcolor3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        widget.articleModel.desc.toString().substring(0, 20),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                        color: isactive
                            ? Colors.yellowAccent
                            : kcolor3.withOpacity(0.8),
                        onPressed: () {
                          usersaved.add({
                            'title': widget.articleModel.title,
                            'image': widget.articleModel.image,
                            'description': widget.articleModel.desc,
                            'email': widget.email
                          });
                          isactive = !isactive;

                          setState(() {});
                        },
                        icon: const Icon(FontAwesomeIcons.bookmark))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
