import 'package:flutter/material.dart';

import 'package:lms_mobile/screens/login.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TSU'),
      ),
      body: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
