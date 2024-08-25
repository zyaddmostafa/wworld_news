import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class BookmarkNodata extends StatelessWidget {
  const BookmarkNodata({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 220,
        ),
        CircleAvatar(
          radius: 35,
          child: Icon(
            Icons.save,
            color: kcolor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "You haven't saved any articles\n yet.Start reading and\n bookmarking them now",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }
}
