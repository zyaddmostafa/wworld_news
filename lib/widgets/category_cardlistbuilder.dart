import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/cubits/getnews/getnews_cubit.dart';
import 'package:uworld_news/views/specificcategory_view.dart';
import 'package:uworld_news/widgets/category_card.dart';

class CategoryCardlistbuilder extends StatefulWidget {
  const CategoryCardlistbuilder({super.key});

  @override
  State<CategoryCardlistbuilder> createState() =>
      _CategoryCardlistbuilderState();
}

class _CategoryCardlistbuilderState extends State<CategoryCardlistbuilder> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 30,
        ),
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentindex = index;
              setState(() {});
              BlocProvider.of<GetnewsCubit>(context)
                  .getnews(categoryname: categorylist[index]);
              Navigator.pushNamed(context, SpecificcategoryView.id,
                  arguments: categorylist[index]);
            },
            child: CategoryCard(
              isactive: currentindex == index,
              categoryname: categorylist[index],
            ),
          );
        },
      ),
    );
  }
}
