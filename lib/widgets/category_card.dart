import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.categoryname, required this.isactive});
  final String categoryname;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: kcolor),
            child: Center(
              child: Text(
                categoryname,
                style: const TextStyle(fontSize: 18, color: kcolor2),
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kcolor3.withOpacity(0.12)),
            child: Center(
              child: Text(
                categoryname,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
  }
}
