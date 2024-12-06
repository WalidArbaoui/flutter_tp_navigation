import 'package:flutter/material.dart';
import 'package:tp_navigation/Routing/second_screen.dart';
import 'package:tp_navigation/Routing/home_screen.dart';
import 'package:tp_navigation/Routing/third_screen.dart';

class GenerateRouteManager1 extends StatelessWidget {
  const GenerateRouteManager1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          return MaterialPageRoute(builder: (context) => const SecondScreen());
        }
        if (settings.name == '/third') {
          return MaterialPageRoute(builder: (context) => const ThirdScreen());
        }
        return null;
      },
    );
  }
}

class GenerateRouteManagerAnimation1 extends StatelessWidget {
  const GenerateRouteManagerAnimation1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SecondScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                    position: animation.drive(tween), child: child);
              });
        }
        if (settings.name == '/third') {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ThirdScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                    position: animation.drive(tween), child: child);
              });
        }
        return null;
      },
    );
  }
}

class GenerateRouteManagerAnimation2 extends StatelessWidget {
  const GenerateRouteManagerAnimation2({super.key});

  PageRouteBuilder _createRouteBuilder(Widget page, Offset beginOffset) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: beginOffset, end: end)
              .chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          return _createRouteBuilder(
            const SecondScreen(),
            const Offset(1.0, 0.0),
          );
        }
        if (settings.name == '/third') {
          return _createRouteBuilder(
            const ThirdScreen(),
            const Offset(0.0, 1.0),
          );
        }
        return null;
      },
    );
  }
}
