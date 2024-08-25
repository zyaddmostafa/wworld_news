import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {super.key,
      required this.title,
      required this.subtitle,
      this.titlepadding = 90,
      this.subtitlepadding = 50});
  final String title;
  final String subtitle;
  final double titlepadding;
  final double subtitlepadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: titlepadding),
          child: Text(
            title,
            style: const TextStyle(fontSize: 23),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(right: subtitlepadding),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 17, color: kcolor3),
          ),
        )
      ],
    );
  }
}
