import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences_example/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences Demo',
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}
