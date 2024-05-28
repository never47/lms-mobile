import 'package:flutter/material.dart';

import 'package:lms_mobile/screens/login.dart';

void main() {
  runApp(const App());
  WidgetsFlutterBinding.ensureInitialized();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
