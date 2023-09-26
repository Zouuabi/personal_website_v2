import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../core/box_decoration.dart';
import 'widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static List<Map<String, String>> projects = [
    {'project': 'Kalonga', 'link': 'https://kalonga.oubeid.com/'},
    {'project': 'Speedy', 'link': 'https://speedy.oubeid.com/'},
    {'project': 'Chess', 'link': 'https://chessproject.web.app/'},
    {
      'project': 'Social Media App',
      'link': 'https://socialmediaapp-5be9c.web.app/'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
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
                        child: ProjectCard(projectName: e['project']!),
                      )))),
            )
            .toList(),
      ),
    );
  }
}
