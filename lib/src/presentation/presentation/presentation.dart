import 'package:flutter/material.dart';

import '../../core/box_decoration.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100),
      child: (size.width > 600)
          ? Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: kWSNeumorphicDecoration.copyWith(
                        shape: BoxShape.circle),
                    child: const CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
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
              ],
            )
          : Column(
              children: [
                Container(
                  decoration:
                      kWSNeumorphicDecoration.copyWith(shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/photo.jpg'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    'I\'m a full stack developer (React.js & Node.js) with a focus on creating (and occasionally designing) exceptional digital experiences that are fast, accessible, visually appealing, and responsive. Even though I have been creating web applications for over 7 years, I still love it as if it was something new.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
    );
  }
}
