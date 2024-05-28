import 'package:flutter/material.dart';

import 'package:lms_mobile/widgets/main_drawer.dart';

import 'package:lms_mobile/tools/network_manager.dart';
import 'package:http/http.dart' as http;

class StudentCard extends StatefulWidget {
  const StudentCard({super.key});

  @override
  State<StudentCard> createState() => _StudentCard();
}

void onClick() async {
  http.Response response = await NetworkManager().getStudentCard();
  print(response.headers);
  print(response.body);
  // print(response.statusCode);
}

class _StudentCard extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Card'),
      ),
      drawer: const MainDrawer(),
      body: const TextButton(
        onPressed: onClick,
        child: Text(
          'adsasd',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
