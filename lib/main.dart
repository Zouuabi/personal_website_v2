import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
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
    Size size = MediaQuery.sizeOf(context);
    var navBarTextStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      width: size.width < 600 ? size.width * 0.9 : size.width * 0.6,
      height: 50,
      decoration: kWSNeumorphicDecoration.copyWith(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: onHomePressed,
            child: Text(
              'Home',
              style: navBarTextStyle,
            ),
          ),
          TextButton(
            onPressed: onProjectsPressed,
            child: Text(
              'Projects',
              style: navBarTextStyle,
            ),
          ),
          TextButton(
            onPressed: onAboutMePressed,
            child: Text(
              'About Me',
              style: navBarTextStyle,
            ),
          ),
          TextButton(
            onPressed: onContactMePressed,
            child: Text(
              'Contact Me',
              style: navBarTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: const Color.fromARGB(31, 158, 158, 158),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 150,
            width: 350,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                  'https://miro.medium.com/v2/resize:fit:1400/1*TwB7bgCXlv9rreV8-b7nSg.jpeg',
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Name',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'sdfds sdjfhds j dsjfsdkjbf sdjfhk jds fdjskf sdjfd skjfh  jsdhfjdkfhsfd fjsdhf sdfd sdf sdfs sdfdf sdf ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    UsedTechnology(child: 'Flutter'),
                    UsedTechnology(child: 'Firebase'),
                    UsedTechnology(child: 'Github'),
                    UsedTechnology(child: 'Dart'),
                    UsedTechnology(child: 'Figma'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UsedTechnology extends StatelessWidget {
  const UsedTechnology({super.key, required this.child});
  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 20,
      decoration: kWSNeumorphicDecoration.copyWith(
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        child,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme().apply(
              fontFamily: 'Perma',
              bodyColor: Colors.white,
              displayColor: Colors.white),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
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
    Size size = MediaQuery.sizeOf(context);
    List<Widget> pages = [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 100),

        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: (size.width > 600)
                ? Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: kWSNeumorphicDecoration.copyWith(
                              shape: BoxShape.circle),
                          child: const CircleAvatar(
                            radius: 200,
                            backgroundImage:
                                AssetImage('assets/images/photo.jpg'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                            'I\'m a fuull stack developer (React.js & Node.js) with a focus on creating (and occasionally designing) exceptional digital experiences that are fast, accessible, visually appealing, and responsive. Even though I have been creating web applications for over 7 years, I still love it as if it was something new.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      const Spacer(),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        decoration: kWSNeumorphicDecoration.copyWith(
                            shape: BoxShape.circle),
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/images/photo.jpg'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'I\'m a full stack developer (React.js & Node.js) with a focus on creating (and occasionally designing) exceptional digital experiences that are fast, accessible, visually appealing, and responsive. Even though I have been creating web applications for over 7 years, I still love it as if it was something new.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  )),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Container(
        //       decoration:
        //           kWSNeumorphicDecoration.copyWith(shape: BoxShape.circle),
        //       child: const CircleAvatar(
        //         radius: 150,
        //         backgroundImage: AssetImage('assets/images/photo.jpg'),
        //       ),
        //     ),
        //     Text(
        //       """
        //       I am Oubeid Zouabi , a Flutter developer and co-founder of Mouvema—a groundbreaking
        //       mobile app platform revolutionizing logistics.
        //       My passion lies in creating mobile applications that make a difference.""",
        //       textAlign: TextAlign.center,
        //       style: Theme.of(context).textTheme.bodyLarge,
        //     )
        //   ],
        // ),
      ),
      Center(
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
                          decoration: kWSNeumorphicDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(10),
                          child: ProjectCard(),
                        )))),
              )
              .toList(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  }),
                ],
              )
            ],
          )),
    ));
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
