import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(name)],
    );
  }
}
