import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/helpers/customsnakebar.dart';
import 'package:uworld_news/auth/signupuser_method.dart';
import 'package:uworld_news/views/favtopics_view.dart';
import 'package:uworld_news/helpers/custom_textfield.dart';
import 'package:uworld_news/views/verfiedemail_view.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/custombuttom.dart';
import 'package:uworld_news/helpers/passowrd_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static String id = ksignupview;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  GlobalKey<FormState> formkey = GlobalKey();
  String? sginupemail, sginuppassword, name;
  bool isloading = false;
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
                  title: 'Welcome to WorldNews👋',
                  subtitle:
                      'Hello ,I guess you are new around here. You can start using the App after sign up'),
              const SizedBox(
                height: 40,
              ),
              CustomTextfield(
                  onchange: (value) {
                    name = value;
                  },
                  hint: 'Username',
                  icon: const Icon(FontAwesomeIcons.user)),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                  onchange: (value) {
                    sginupemail = value;
                  },
                  hint: 'Email Adress',
                  icon: const Icon(Icons.email)),
              const SizedBox(
                height: 15,
              ),
              PassowrdTextfield(
                onchange: (value) {
                  sginuppassword = value;
                },
                hint: 'Password',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 40,
              ),
              Custombuttom(
                islodaing: isloading,
                buttomname: 'Sign Up',
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    users.add(
                      {
                        'name': name, // John Doe
                        'email': sginupemail, // Stokes and Sons
                        'password': sginuppassword // 42
                      },
                    );
                    isloading = true;
                    setState(() {});
                    try {
                      await signup(
                          email: sginupemail!, password: sginuppassword!);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerfiedemailView(
                                  semail: sginupemail!,
                                )),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showsnackbar(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        showsnackbar(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                      showsnackbar(
                          context, 'something is wrong try agin later');
                    }
                    isloading = false;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 235,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(color: kcolor3, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
