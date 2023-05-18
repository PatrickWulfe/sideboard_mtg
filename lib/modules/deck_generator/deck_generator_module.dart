import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:sideboard_mtg/modules/deck_generator/deck_generator_index.dart';

class DeckGeneratorModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => OpenAIRepositoryImpl()),
        BlocBind.singleton<DeckGeneratorBloc>(
          (i) => DeckGeneratorBloc(openAIRepository: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          DeckGeneratorRoutes.deckGenerator.name,
          child: (context, args) => const DeckGeneratorPage(),
        ),
      ];
}

enum DeckGeneratorRoutes {
  deckGenerator,
}

extension DeckGeneratorRouteNameExtension on DeckGeneratorRoutes {
  String get name {
    switch (this) {
      case DeckGeneratorRoutes.deckGenerator:
        return '/deck_generator';
    }
  }
}
