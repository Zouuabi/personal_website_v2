import 'package:flutter/material.dart';

import 'used_tech.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectName,
  });
  final String projectName;

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
                  projectName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'A mobile app platform, tailored to the needs of drivers, individuals, and companies engaged in shipping and logistics. This endeavor seeks to streamline and elevate the shipping process, providing an intuitive and user-friendly experience for all stakeholders involved.',
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
