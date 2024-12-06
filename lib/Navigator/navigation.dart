import 'package:flutter/material.dart';
import 'package:tp_navigation/Navigator/first_screen.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Example',
      home: FirstScreen(),
    );
  }
}
