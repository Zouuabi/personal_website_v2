import 'package:flutter/material.dart';

import '../../../core/box_decoration.dart';

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
