import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class TopicsCard extends StatefulWidget {
  const TopicsCard({super.key, required this.topic});
  final String topic;

  @override
  State<TopicsCard> createState() => _TopicsCardState();
}

class _TopicsCardState extends State<TopicsCard> {
  bool isactive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isactive = !isactive;
        setState(() {});
      },
      child: isactive
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              decoration: BoxDecoration(
                  color: kcolor, borderRadius: BorderRadius.circular(12)),
              child: Text(
                widget.topic,
                style: const TextStyle(color: kcolor2, fontSize: 17),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              decoration: BoxDecoration(
                  color: kcolor3.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                widget.topic,
                style: const TextStyle(color: kcolor3, fontSize: 17),
              ),
            ),
    );
  }
}
