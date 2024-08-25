import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {super.key,
      required this.hint,
      this.onchange,
      this.obscuretext = false,
      this.maxlines = 1,
      required this.icon,
      this.sufficicon,
      this.onSaved});
  final String hint;
  final Function(String)? onchange;
  final bool obscuretext;
  final int maxlines;
  final Icon icon;
  final Icon? sufficicon;
  final Function(String?)? onSaved;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onSaved: widget.onSaved,
        maxLines: widget.maxlines,
        obscureText: widget.obscuretext,
        validator: (value) {
          if (value!.isEmpty) {
            return 'is required';
          }
        },
        onChanged: widget.onchange,
        decoration: InputDecoration(
          suffixIcon: widget.sufficicon,
          suffixIconColor: kcolor3,
          prefixIcon: widget.icon,
          prefixIconColor: kcolor3,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: kcolor3),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kcolor)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: kcolor3,
            ),
          ),
        ),
      ),
    );
  }
}
