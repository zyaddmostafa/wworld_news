import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/widgets/news_cardbuilder.dart';

class SpecificcategoryView extends StatelessWidget {
  const SpecificcategoryView({super.key});
  static String id = kspecificcategoryview;
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    return BlocProvider(
      create: (context) => GetnewsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arg.toString()),
          centerTitle: true,
        ),
        body: Column(
          children: [
            NewsCardbuilder(
              categoryname: arg.toString(),
              height: 703,
            ),
          ],
        ),
      ),
    );
  }
}
