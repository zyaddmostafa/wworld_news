import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/views/getstart_view.dart';

class Appdefintion extends StatelessWidget {
  const Appdefintion(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  final String title, subtitle, image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, GetstartView.id);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                height: 350,
                width: 320,
                image,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: kcolor3, fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
