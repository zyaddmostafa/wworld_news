import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uworld_news/constants.dart';
import 'package:uworld_news/views/getstart_view.dart';
import 'package:uworld_news/widgets/appdefintion.dart';
import 'package:uworld_news/widgets/custombuttom.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = khomepage;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = PageController();
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                currentindex = value;
              });
            },
            controller: _controller,
            children: const [
              Appdefintion(
                title: 'First to know',
                image: 'assets/Muizz_Street_-_Egypt.jpg',
                subtitle:
                    'all our news is trusted from\n\t\t\t\t\t\t\tour trused sourses',
              ),
              Appdefintion(
                title: 'variety',
                image: 'assets/Michael-Phelps-by-Mike-Lewis-57.jpg',
                subtitle: 'search in any category you intersted in ',
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 2,
          effect: const ExpandingDotsEffect(
              dotColor: kcolor3,
              activeDotColor: kcolor,
              dotHeight: 10,
              dotWidth: 10),
        ),
        const SizedBox(
          height: 50,
        ),
        Custombuttom(
          buttomname: currentindex == 1 ? 'continue' : 'Next',
          onTap: () {
            if (currentindex != 1) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceOut,
              );
            }
            if (currentindex == 1) {
              Navigator.pushReplacementNamed(context, GetstartView.id);
            }
          },
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    ));
  }
}
