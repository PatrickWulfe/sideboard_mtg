import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/modules/app/presentation/home_page/home_page.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind.singleton((i) => OpenAIRepositoryImpl()),
        // Bind.singleton<DeckGeneratorBloc>(
        //   (i) => DeckGeneratorBloc(openAIRepository: i()),
        // ),
      ];

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
      ];
}

enum AppRoutes {
  home,
  deckGenerator,
}

extension AppRouteNameExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.deckGenerator:
        return '/deck_generator';
    }
  }
}
