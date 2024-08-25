import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/views/home_view.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});
  static String id = kstartview;

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.newspaper,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'World News',
              style: TextStyle(color: Colors.white, fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
