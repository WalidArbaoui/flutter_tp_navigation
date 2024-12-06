import 'package:flutter/material.dart';
import 'package:tp_navigation/Navigator/second_screen.dart';

import 'package:animations/animations.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text('MaterialPageRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SecondScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          }));
                },
                child: const Text('FadeTransition')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SecondScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: animation.drive(Tween(
                                begin: const Offset(0.0, 1.0),
                                end: Offset.zero,
                              )),
                              child: child,
                            );
                          }));
                },
                child: const Text('SlideTransition')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SecondScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOutBack;

                        final adjustAnimation = CurvedAnimation(
                          parent: animation,
                          curve: const Interval(0.0, 1.0, curve: curve),
                        );

                        var tween = Tween(begin: begin, end: end);
                        var offsetAnimation = adjustAnimation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 600),
                    ),
                  );
                },
                child: const Text('transitionDuration')),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SecondScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                              child: child,
                            );
                          },
                        ),
                      )
                    },
                child: const Text('Amination bib')),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SecondScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            }),
                      ),
                    },
                child: const Text('Sans animations')),
          ],
        ),
      ),
    );
  }
}
