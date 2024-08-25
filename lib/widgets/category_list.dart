import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(
      {super.key, required this.isactive, required this.categoryname});
  final bool isactive;
  final String categoryname;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
              color: kcolor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              categoryname,
              style: const TextStyle(color: kcolor2),
            ),
          )
        : Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
              color: kcolor3.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              categoryname,
              style: const TextStyle(color: kcolor3),
            ),
          );
  }
}
