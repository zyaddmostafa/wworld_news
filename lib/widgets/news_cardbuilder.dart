import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/widgets/news_cardlist.dart';

class NewsCardbuilder extends StatefulWidget {
  const NewsCardbuilder({
    super.key,
    required this.height,
    this.categoryname = 'general',
    this.email = '',
  });
  final double height;
  final String categoryname;
  final String email;
  @override
  State<NewsCardbuilder> createState() => _NewsCardbuilderState();
}

class _NewsCardbuilderState extends State<NewsCardbuilder> {
  @override
  void initState() {
    context.read<GetnewsCubit>().getnews(categoryname: widget.categoryname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetnewsCubit, GetnewsState>(
      builder: (context, state) {
        if (state is Getnewssucsses) {
          return NewsCardlist(
            email: widget.email,
            height: widget.height,
            articleModel: state.article,
          );
        } else if (state is Getnewsisloading) {
          return SizedBox(
            height: widget.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SizedBox(
              height: widget.height,
              child: const Center(
                child: Text(
                  'there was an error',
                  style: TextStyle(fontSize: 40),
                ),
              ));
        }
      },
    );
  }
}
