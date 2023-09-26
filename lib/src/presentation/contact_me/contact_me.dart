import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color.fromARGB(31, 158, 158, 158),
      height: 50,
      width: double.infinity,
      child: const Text(' © 2023 | Coded with ❤️️ by Hassen Khlifi'),
    );
  }
}

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Placeholder(), Footer()],
    );
  }
}
