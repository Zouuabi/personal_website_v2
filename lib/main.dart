import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.white,
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.white,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white)),
      home: const HomePage(),
    );
  }
}

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
  List<Map<String, String>> projects = [
    {
      'project': 'Kalonga \n Press To Preview',
      'link': 'https://kalonga.oubeid.com/'
    },
    {
      'project': 'Speedy \nPress To Preview',
      'link': 'https://speedy.oubeid.com/'
    },
    {
      'project': 'Chess \n Press To Preview',
      'link': 'https://chessproject.web.app/'
    },
    {
      'project': 'Social Media App \n Press To Preview',
      'link': 'https://socialmediaapp-5be9c.web.app/'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 200, vertical: 100),
        width: 100,
        height: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration:
                  kWSNeumorphicDecoration.copyWith(shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/photo.jpg'),
              ),
            ),
            Text(
              """
              I am Oubeid Zouabi , a Flutter developer and co-founder of Mouvema—a groundbreaking 
              mobile app platform revolutionizing logistics.
              My passion lies in creating mobile applications that make a difference.""",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      Container(
        child: Center(
          child: Wrap(
            children: projects
                .map(
                  (e) => Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse(e['link']!),
                      builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: Container(
                            width: 300,
                            height: 450,
                            decoration: kWSNeumorphicDecoration.copyWith(),
                            margin: const EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              e['project']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            )),
                          )))),
                )
                .toList(),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(50),
        color: Colors.red,
        height: 800,
        width: double.infinity,
      ),
      Container(
        margin: const EdgeInsets.all(50),
        color: Colors.green,
        height: 800,
        width: double.infinity,
      ),
    ];
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 32, 89, 106),
                Color.fromARGB(255, 65, 118, 114),
              ],
            ),
          ),
          width: double.infinity,
          height: double.infinity,

          /// *  Because the choice of using a stack to layout my sections
          /// * the code must be read from button to top

          child: Stack(
            children: [
              ScrollablePositionedList.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index],
                itemScrollController: itemScrollController,
                scrollOffsetController: scrollOffsetController,
                itemPositionsListener: itemPositionsListener,
                scrollOffsetListener: scrollOffsetListener,
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: FoatingAppBar(onHomePressed: () {
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
                }),
              )
            ],
          )),
    ));
  }
}

class FoatingAppBar extends StatelessWidget {
  const FoatingAppBar({
    Key? key,
    required this.onHomePressed,
    required this.onProjectsPressed,
    required this.onAboutMePressed,
    required this.onContactMePressed,
  }) : super(key: key);
  final VoidCallback onHomePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onAboutMePressed;
  final VoidCallback onContactMePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: kWSNeumorphicDecoration.copyWith(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: onHomePressed,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: onProjectsPressed,
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: onAboutMePressed,
            child: const Text('About Me'),
          ),
          TextButton(
            onPressed: onContactMePressed,
            child: const Text('Contact Me'),
          ),
        ],
      ),
    );
  }
}

const BoxDecoration kWSNeumorphicDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 32, 89, 106),
      Color.fromARGB(255, 65, 118, 114),
    ],
  ),
  boxShadow: [
    BoxShadow(
        color: Color.fromARGB(255, 0, 0, 0),
        offset: Offset(4, 4),
        spreadRadius: 0.5,
        blurRadius: 10),
    BoxShadow(
        color: Color.fromARGB(255, 90, 90, 90),
        offset: Offset(-4, -4),
        spreadRadius: 0.5,
        blurRadius: 10),
  ],
);
