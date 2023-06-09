import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';
import 'package:sideboard/modules/mtg_submodule/mtg_submodule.dart';

class DeckGeneratorModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => OpenAIRepositoryImpl()),
        BlocBind.singleton<DeckGeneratorBloc>(
          (i) => DeckGeneratorBloc(
            openAIRepository: i(),
          ),
        ),
      ];

  @override
  List<Module> get imports => [
        MtgSubmodule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          DeckGeneratorRoutes.base.name,
          child: (context, args) => const DeckGeneratorPage(),
        ),
      ];
}

enum DeckGeneratorRoutes {
  base,
}

extension DeckGeneratorRouteNameExtension on DeckGeneratorRoutes {
  String get name {
    switch (this) {
      case DeckGeneratorRoutes.base:
        return '/';
    }
  }
}
