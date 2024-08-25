import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/widgets/category_cardlistbuilder.dart';
import 'package:uworld_news/widgets/custom_title.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});
  static String id = kcategoryview;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnewsCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: const [
              SizedBox(
                height: 65,
              ),
              CustomTitle(
                  titlepadding: 240,
                  title: 'Categories',
                  subtitle: 'Thousands of articles in each category'),
              SizedBox(
                height: 40,
              ),
              CategoryCardlistbuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
