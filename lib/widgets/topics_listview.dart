import 'package:flutter/material.dart';
import 'package:uworld_news/widgets/topics_card.dart';

class Topiclistview extends StatelessWidget {
  const Topiclistview({
    super.key,
    required this.topicslist,
  });

  final List<String> topicslist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: topicslist.length,
        itemBuilder: (context, index) {
          return TopicsCard(
            topic: topicslist[index],
          );
        },
      ),
    );
  }
}
