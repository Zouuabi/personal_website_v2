import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../core/box_decoration.dart';

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
    var navBarTextStyle;
    return size.width < 600
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/logoh.svg',
                  width: 23,
                  height: 23,
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/images/hamburgerIcon.svg'),
                  onPressed: () {
                    final RenderBox renderBox = Overlay.of(context)
                        .context
                        .findRenderObject() as RenderBox;

                    showMenu(
                      color: const Color.fromARGB(255, 32, 89, 106),
                      context: context,
                      position: RelativeRect.fromLTRB(
                        renderBox.size.width - 100.0, // Left
                        MediaQuery.of(context).padding.top, // Top
                        renderBox.size.width, // Right
                        renderBox.size.height, // Bottom
                      ),
                      items: [
                        CustomPopupMenuItem(
                          onPressed: onHomePressed,
                          child: 'Home',
                        ),
                        CustomPopupMenuItem(
                          onPressed: onProjectsPressed,
                          child: 'Projects',
                        ),
                        CustomPopupMenuItem(
                          onPressed: onAboutMePressed,
                          child: 'About me',
                        ),
                        CustomPopupMenuItem(
                          onPressed: onContactMePressed,
                          child: 'Contact me',
                        ),

                        // Add more items here
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: size.width < 600 ? size.width * 0.9 : size.width * 0.7,
                height: 50,
                decoration: kWSNeumorphicDecoration.copyWith(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logoh.svg',
                      width: 23,
                      height: 23,
                    ),
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
              ),
            ],
          );
  }
}

class CustomPopupMenuItem<T> extends PopupMenuEntry<T> {
  const CustomPopupMenuItem({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final String child;
  final VoidCallback onPressed;

  @override
  State createState() => _CustomPopupMenuItemState();

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == null;
}

class _CustomPopupMenuItemState extends State<CustomPopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: SizedBox(
          height: 70,
          width: 150,
          child: TextButton(
            onPressed: () {
              widget.onPressed();
              Navigator.of(context).pop();
            },
            child: Text(widget.child),
          ),
        ));
  }
}
