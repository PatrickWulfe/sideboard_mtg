import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/modules/app/view/home_page/home_page.dart';
import 'package:sideboard/modules/card_search/card_search_module.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          AppRoutes.home.name,
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute<dynamic>(
          AppRoutes.deckGenerator.name,
          module: DeckGeneratorModule(),
        ),
        ModuleRoute<dynamic>(
          AppRoutes.cardSearch.name,
          module: CardSearchModule(),
        ),
      ];
}

enum AppRoutes {
  home,
  deckGenerator,
  cardSearch,
}

extension AppRouteNameExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.deckGenerator:
        return '/deck_generator';
      case AppRoutes.cardSearch:
        return '/card_search';
    }
  }
}
