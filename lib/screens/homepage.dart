import 'package:flutter/material.dart';
import 'package:lms_mobile/constants/user_session.dart';
import 'package:lms_mobile/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TSU'),
      ),
      drawer: const MainDrawer(),
      body: Text(UserSession().userName),
    );
  }
}
