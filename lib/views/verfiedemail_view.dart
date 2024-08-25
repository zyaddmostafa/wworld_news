import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/customsnakebar.dart';
import 'package:uworld_news/views/favtopics_view.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/custombuttom.dart';

class VerfiedemailView extends StatefulWidget {
  const VerfiedemailView({
    super.key,
    this.semail = '',
  });
  static String id = kverifiedview;
  final String semail;

  @override
  State<VerfiedemailView> createState() => _VerfiedemailViewState();
}

class _VerfiedemailViewState extends State<VerfiedemailView> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, FavtopicsView.id,
            arguments: widget.semail);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const SizedBox(
              height: 35,
            ),
            const CustomTitle(
                title: 'Welcome to WorldNews👋',
                subtitle:
                    ' hello , check ur email we send to you to verified your email to continue and enjoy our app'),
            const SizedBox(
              height: 50,
            ),
            Custombuttom(
              buttomname: 'Resend to email',
              onTap: () {
                FirebaseAuth.instance.currentUser!.sendEmailVerification();
              },
            ),
          ],
        ),
      ),
    );
  }
}
