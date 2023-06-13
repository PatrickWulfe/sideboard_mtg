import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:sideboard/modules/app/app_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              child: const Text('Go to chat'),
              onPressed: () => Modular.to.navigate(
                '${AppRoutes.deckGenerator.name}/',
              ),
            ),
            const Gap(8),
            FilledButton(
              child: const Text('Go to search'),
              onPressed: () => Modular.to.navigate(
                '${AppRoutes.cardSearch.name}/',
              ),
            ),
            const Gap(8),
            FilledButton(
              child: const Text('Go to parser'),
              onPressed: () => Modular.to.navigate(
                '${AppRoutes.cardParser.name}/',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
