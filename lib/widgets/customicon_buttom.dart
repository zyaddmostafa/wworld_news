import 'package:flutter/material.dart';

class Customiconbuttom extends StatelessWidget {
  const Customiconbuttom(
      {super.key, required this.onPressed, required this.icon});
  final void Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
