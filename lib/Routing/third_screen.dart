import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troisième page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text('Return à la deuxième page')),
      ),
    );
  }
}
