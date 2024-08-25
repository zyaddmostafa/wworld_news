import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class Customprofieloptions extends StatelessWidget {
  const Customprofieloptions({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
  });
  final void Function()? onPressed;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7.6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: kcolor3.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 79, 83, 102), fontSize: 20),
            ),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
