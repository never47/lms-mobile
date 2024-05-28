import 'package:flutter/material.dart';
import 'package:lms_mobile/widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My University Profile'),
      ),
      drawer: const MainDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Computer Science Student',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'About Me:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'I am a passionate computer science student at XYZ University. '
              'I love coding and building amazing apps!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Education:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Bachelor of Science in Computer Science'),
              subtitle: Text('XYZ University (2018 - Present)'),
              leading: Icon(Icons.school),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('john.doe@example.com'),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text('Phone'),
              subtitle: Text('+1234567890'),
              leading: Icon(Icons.phone),
            ),
          ],
        ),
      ),
    );
  }
}
