import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/navigationbar.dart';
import 'package:uworld_news/widgets/custombuttom.dart';
import 'package:uworld_news/widgets/topics_listview.dart';

class FavtopicsView extends StatelessWidget {
  const FavtopicsView({super.key});
  static String id = kfavtopicsview;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 82),
              child: Text(
                'Select your favorite topics',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Select some of your favorite topics to let us suggest better news for you',
              style: TextStyle(fontSize: 18, color: kcolor3),
            ),
            Topiclistview(topicslist: topicslist),
            Custombuttom(
              buttomname: 'Next',
              onTap: () {
                Navigator.pushNamed(context, Navigationbottombar.id,
                    arguments: email);
              },
            ),
          ],
        ),
      ),
    );
  }
}
