import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/firebase_options.dart';
import 'package:uworld_news/helpers/navigationbar.dart';
import 'package:uworld_news/simpleblocobserver.dart';
import 'package:uworld_news/views/home_view.dart';
import 'package:uworld_news/views/bookmark_view.dart';
import 'package:uworld_news/views/category_view.dart';
import 'package:uworld_news/views/favtopics_view.dart';
import 'package:uworld_news/auth/forgetpass_view.dart';
import 'package:uworld_news/views/getstart_view.dart';
import 'package:uworld_news/views/start_view.dart';
import 'package:uworld_news/auth/login_view.dart';
import 'package:uworld_news/views/news_view.dart';
import 'package:uworld_news/views/profile_view.dart';
import 'package:uworld_news/auth/signup_view.dart';
import 'package:uworld_news/views/specificcategory_view.dart';
import 'package:uworld_news/views/specificnews_view.dart';
import 'package:uworld_news/views/verfiedemail_view.dart';

void main() async {
  Bloc.observer = Simpleblocobserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Uworldnews());
}

class Uworldnews extends StatelessWidget {
  const Uworldnews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        StartView.id: (context) => const StartView(),
        GetstartView.id: (context) => const GetstartView(),
        LoginView.id: (context) => const LoginView(),
        SignupView.id: (context) => const SignupView(),
        FavtopicsView.id: (context) => const FavtopicsView(),
        NewsView.id: (context) => const NewsView(),
        CategoryView.id: (context) => const CategoryView(),
        BookmarkView.id: (context) => const BookmarkView(),
        ProfileView.id: (context) => const ProfileView(),
        SpecificnewsView.id: (context) => const SpecificnewsView(),
        ForgetpassView.id: (context) => const ForgetpassView(),
        SpecificcategoryView.id: (context) => const SpecificcategoryView(),
        HomeView.id: (context) => const HomeView(),
        Navigationbottombar.id: (context) => const Navigationbottombar(),
        VerfiedemailView.id: (context) => const VerfiedemailView()
      },
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData &&
                  FirebaseAuth.instance.currentUser!.emailVerified
              ? const Navigationbottombar()
              : const StartView();
        },
      ),
    );
  }
}
