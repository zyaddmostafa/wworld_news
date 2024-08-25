import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/auth/login_view.dart';
import 'package:uworld_news/widgets/custombuttom.dart';

class GetstartView extends StatelessWidget {
  const GetstartView({super.key});
  static String id = kgetstartview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/qdILEeFtmC-no-background.png',
          ),
          const SizedBox(
            height: 140,
          ),
          const Text(
            'All news in one place , be \nthe first to know last news',
            style: TextStyle(color: Colors.grey, fontSize: 17),
          ),
          const SizedBox(
            height: 60,
          ),
          Custombuttom(
            buttomname: 'Get Started',
            onTap: () {
              Navigator.pushReplacementNamed(context, LoginView.id);
            },
          ),
        ],
      ),
    );
  }
}
