import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/widgets/category_list.dart';

class CategoryListbuilder extends StatefulWidget {
  const CategoryListbuilder({super.key});

  @override
  State<CategoryListbuilder> createState() => _CategoryListbuilderState();
}

class _CategoryListbuilderState extends State<CategoryListbuilder> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorylist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<GetnewsCubit>(context)
                    .getnews(categoryname: categorylist[index]);
                currentindex = index;
                setState(() {});
              },
              child: CategoryList(
                categoryname: categorylist[index],
                isactive: currentindex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
