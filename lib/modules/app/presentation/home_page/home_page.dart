import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/modules/app/app_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FilledButton(
          child: const Text('Go to chat'),
          onPressed: () => Modular.to.navigate(
            AppRoutes.deckGenerator.name + '/',
          ),
        ),
      ),
    );
  }
}
