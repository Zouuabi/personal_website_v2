import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../about_me.dart/about_me.dart';
import '../contact_me/contact_me.dart';
import '../presentation/presentation.dart';
import '../navigation_bar.dart';
import '../projects/projects_page.dart';
import '../social_links.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final List<Widget> pages = const [
    PresentationPage(),
    ProjectsPage(),
    AboutMePage(),
    ContactMePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 32, 89, 106),
          Color.fromARGB(255, 65, 118, 114),
        ],
      ),
    );
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.0732),
          decoration: boxDecoration,
          width: double.infinity,
          height: double.infinity,

          /// *  Because the choice of using a stack to layout my sections
          /// * the code must be read from button to top

          child: Stack(
            children: [
              const SideInfoSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0732),
                child: ScrollablePositionedList.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) => pages[index],
                  itemScrollController: itemScrollController,
                  scrollOffsetController: scrollOffsetController,
                  itemPositionsListener: itemPositionsListener,
                  scrollOffsetListener: scrollOffsetListener,
                ),
              ),
              FoatingAppBar(onHomePressed: () {
                itemScrollController.scrollTo(
                    index: 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              }, onProjectsPressed: () {
                itemScrollController.scrollTo(
                    index: 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              }, onAboutMePressed: () {
                itemScrollController.scrollTo(
                    index: 2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              }, onContactMePressed: () {
                itemScrollController.scrollTo(
                    index: 150,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              })
            ],
          )),
    ));
  }
}
