import 'package:flutter/material.dart';
import 'package:tp_navigation/Routing/second_screen.dart';
import 'package:tp_navigation/Routing/home_screen.dart';
import 'package:tp_navigation/Routing/third_screen.dart';

class RouteManager1 extends StatelessWidget {
  const RouteManager1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
      },
    );
  }
}
