import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SideInfoSection extends StatelessWidget {
  const SideInfoSection({
    Key? key,
  }) : super(key: key);

  Link linkHelper(
      {required String link, required String iconPath, required screenWidth}) {
    return Link(
        target: LinkTarget.blank,
        uri: Uri.parse(link),
        builder: ((context, followLink) => IconButton(
            onPressed: followLink,
            icon: Image.asset(
              iconPath,
              width: screenWidth * 0.05,
              color: Colors.white,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            linkHelper(
                iconPath: 'assets/images/github.png',
                link: 'https://github.com/hassenkh/',
                screenWidth: size.width),
            linkHelper(
                link: 'https://www.linkedin.com/in/khlifi-hassen-789b09231/',
                iconPath: 'assets/images/linkedin.png',
                screenWidth: size.width),
            linkHelper(
                link: 'https://www.instagram.com/khlifi_h/',
                iconPath: 'assets/images/instagram.png',
                screenWidth: size.width),
            OnSideContactInfo(screenHeight: size.height, child: null),
          ],
        ),
        Link(
          uri: Uri.parse('https://mail.google.com/'),
          target: LinkTarget.blank,
          builder: (context, followLink) => TextButton(
            onPressed: followLink,
            child: OnSideContactInfo(
                screenHeight: size.height,
                orientation: 'rightToLeft',
                child: InkWell(
                  onTap: followLink,
                  child: const Text(
                    'contact@hassenkhlifi.com',
                    //  style: kSecondaryTextStyle.copyWith(color: kWhiteColor)
                  ),
                )),
          ),
        )
      ],
    );
  }
}

class OnSideContactInfo extends StatelessWidget {
  const OnSideContactInfo(
      {Key? key,
      required this.screenHeight,
      required this.child,
      this.orientation = 'leftToRight'})
      : super(key: key);

  final double screenHeight;
  final Widget? child;
  final String orientation;

  int getInfoDirection(String dir) {
    if (dir == 'leftToRight') {
      return 3;
    } else if (dir == 'rightToLeft') {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RotatedBox(quarterTurns: getInfoDirection(orientation), child: child),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        RotatedBox(
          quarterTurns: getInfoDirection(orientation),
          child: Container(
            width: 100,
            height: 1,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
