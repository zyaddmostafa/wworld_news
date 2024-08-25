import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uworld_news/auth/googlesignin_method.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/customsnakebar.dart';
import 'package:uworld_news/auth/loginuser_method.dart';
import 'package:uworld_news/helpers/navigationbar.dart';
import 'package:uworld_news/auth/forgetpass_view.dart';
import 'package:uworld_news/auth/signup_view.dart';
import 'package:uworld_news/helpers/custom_textfield.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/custombuttom.dart';
import 'package:uworld_news/widgets/google_facebock_buttom.dart';
import 'package:uworld_news/helpers/passowrd_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = kloginview;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? loginemail, loginpassorwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomTitle(
                  titlepadding: 185,
                  title: 'Welcome Back👋',
                  subtitle:
                      'We are happy to see you again .you can continue where you left off by loginng in'),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                onchange: (value) {
                  loginemail = value;
                },
                hint: 'Email Adress',
                icon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 15,
              ),
              PassowrdTextfield(
                onchange: (value) {
                  loginpassorwd = value;
                },
                hint: 'Password',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetpassView.id);
                  },
                  child: const Text(
                    'Forget password?   ',
                    style: TextStyle(color: kcolor3, fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Custombuttom(
                islodaing: isloading,
                buttomname: 'Sign In',
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    isloading = true;
                    setState(() {});
                    try {
                      await loginuser(
                          email: loginemail!, password: loginpassorwd!);
                      Navigator.pushNamed(context, Navigationbottombar.id,
                          arguments: loginemail);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showsnackbar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showsnackbar(
                            context, 'Wrong password provided for that user.');
                      }
                    }
                    isloading = false;
                    setState(() {});
                  } else {
                    showsnackbar(context, 'something is wrong try agin later');
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 17, color: kcolor3),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GoogleFacebockButtom(
                onTap: () async {
                  try {
                    await signInWithGoogle();
                    Navigator.pushNamed(context, Navigationbottombar.id,
                        arguments: loginemail);
                  } catch (e) {
                    print(e);
                  }
                },
                buttomname: 'Sign In with google',
                image: 'assets/images/Google_Icons-09-512.webp',
              ),
              const SizedBox(
                height: 15,
              ),
              const GoogleFacebockButtom(
                buttomname: 'Sign In with facebook',
                image: 'assets/facebook-logo-icon-free-png.webp',
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an account?  ',
                    style: TextStyle(color: kcolor3, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignupView.id);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
