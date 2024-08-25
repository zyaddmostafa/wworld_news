import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class CustumNotification extends StatefulWidget {
  const CustumNotification({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;

  final String text;

  @override
  State<CustumNotification> createState() => _CustumNotificationState();
}

class _CustumNotificationState extends State<CustumNotification> {
  bool isactive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.6),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
          color: kcolor3.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
                color: Color.fromARGB(255, 79, 83, 102), fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              isactive = !isactive;
              setState(() {});
            },
            child: Switch(
              onChanged: null,
              value: isactive,
              inactiveThumbColor: kcolor,
              inactiveTrackColor: kcolor.withOpacity(0.2),
              // ...
            ),
          ),
        ],
      ),
    );
  }
}
