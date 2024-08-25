import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class GoogleFacebockButtom extends StatelessWidget {
  const GoogleFacebockButtom(
      {super.key, required this.buttomname, this.onTap, required this.image});
  final String buttomname;
  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        decoration: BoxDecoration(
            color: kcolor3.withOpacity(0.09),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 40,
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                buttomname,
                style: const TextStyle(color: kcolor3, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
