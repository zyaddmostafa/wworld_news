import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class Custombuttom extends StatelessWidget {
  const Custombuttom(
      {super.key,
      required this.buttomname,
      this.onTap,
      this.islodaing = false});
  final String buttomname;
  final void Function()? onTap;
  final bool islodaing;
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
            color: kcolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: islodaing
              ? const CircularProgressIndicator(
                  color: kcolor2,
                )
              : Text(
                  buttomname,
                  style: const TextStyle(color: kcolor2, fontSize: 20),
                ),
        ),
      ),
    );
  }
}
