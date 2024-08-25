import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/customsnakebar.dart';
import 'package:uworld_news/auth/restpass_method.dart';
import 'package:uworld_news/helpers/custom_textfield.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/custombuttom.dart';

class ForgetpassView extends StatefulWidget {
  const ForgetpassView({super.key});
  static String id = kforgetpassview;

  @override
  State<ForgetpassView> createState() => _ForgetpassViewState();
}

class _ForgetpassViewState extends State<ForgetpassView> {
  String? email;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomTitle(
                titlepadding: 180,
                title: 'Forget password',
                subtitle:
                    'We need your Email to send you the password reset link to your email'),
            const SizedBox(
              height: 40,
            ),
            CustomTextfield(
              onchange: (value) {
                email = value;
              },
              hint: 'Email Adress',
              icon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: 17,
            ),
            Custombuttom(
              islodaing: isloading,
              buttomname: 'Next',
              onTap: () async {
                isloading = true;
                setState(() {});
                try {
                  await Restpassword(email: email!);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Password link send ! check your email'),
                      );
                    },
                  );
                } on FirebaseAuthException catch (e) {
                  showsnackbar(
                    context,
                    e.toString(),
                  );
                }

                isloading = false;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
