import 'package:flutter/material.dart';
import 'package:hello_world/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoPage(),
    );
  }
}
