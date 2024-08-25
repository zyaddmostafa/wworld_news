import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/widgets/category_listbuilder.dart';
import 'package:uworld_news/helpers/custom_textfield.dart';
import 'package:uworld_news/widgets/custom_title.dart';
import 'package:uworld_news/widgets/news_cardbuilder.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});
  static String id = knewsview;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return BlocProvider(
      create: (context) => GetnewsCubit(),
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            const CustomTitle(
                titlepadding: 280,
                subtitlepadding: 140,
                title: 'Browse',
                subtitle: 'Discover things of this world'),
            const SizedBox(
              height: 30,
            ),
            const CustomTextfield(
              hint: 'Search',
              icon: Icon(Icons.search),
              sufficicon: Icon(Icons.mic),
            ),
            const CategoryListbuilder(),
            NewsCardbuilder(
              email: email.toString(),
              height: 420,
            ),
          ],
        ),
      ),
    );
  }
}
