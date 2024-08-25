import 'package:flutter/material.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/views/bookmark_view.dart';
import 'package:uworld_news/views/category_view.dart';
import 'package:uworld_news/views/news_view.dart';
import 'package:uworld_news/views/profile_view.dart';

class Navigationbottombar extends StatefulWidget {
  const Navigationbottombar({super.key});
  static String id = knavigatorbar;
  @override
  State<Navigationbottombar> createState() => _NavigationbottombarState();
}

class _NavigationbottombarState extends State<Navigationbottombar> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    List pages = [
      const NewsView(),
      const CategoryView(),
      const BookmarkView(),
      ProfileView(
        email: email.toString(),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kcolor2,
        selectedItemColor: kcolor,
        unselectedItemColor: kcolor3,
        selectedLabelStyle: const TextStyle(color: kcolor),
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 32), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: 32), label: 'categorys'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks, size: 32), label: 'bookmarks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 32), label: 'profile'),
        ],
      ),
      body: pages[currentindex],
    );
  }
}
