import 'package:flutter/material.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Input Validation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstScreen(),  // First Screen displayed initially
    );
  }
}
