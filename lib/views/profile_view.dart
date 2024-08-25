import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/auth/login_view.dart';
import 'package:uworld_news/views/home_view.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/customprofieloptions.dart';
import 'package:uworld_news/widgets/custum_notification.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.email = ''});
  static String id = kprofielview;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const CustomTitle(
              titlepadding: 283,
              title: 'Profile',
              subtitle: '',
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    FontAwesomeIcons.user,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        email.substring(0, 4),
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        email,
                        style: const TextStyle(fontSize: 14, color: kcolor3),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustumNotification(text: 'Notifications '),
            const Customprofieloptions(
              text: 'Language',
              icon: Icons.arrow_forward_rounded,
            ),
            const Customprofieloptions(
              text: 'Change password ',
              icon: Icons.arrow_forward_rounded,
            ),
            const Customprofieloptions(
              text: 'Privacy',
              icon: Icons.arrow_forward_rounded,
            ),
            const Customprofieloptions(
              text: 'Terms & Conditions',
              icon: Icons.arrow_forward_rounded,
            ),
            Customprofieloptions(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.pushNamed(context, HomeView.id);
              },
              text: 'Sign Out',
              icon: FontAwesomeIcons.rightFromBracket,
            ),
            Customprofieloptions(
              onPressed: () {
                Navigator.pushNamed(context, LoginView.id);
              },
              text: 'Login with another acc',
              icon: Icons.arrow_forward_rounded,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
