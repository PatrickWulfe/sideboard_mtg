import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:sideboard/modules/card_parser/card_parser_index.dart';
import 'package:sideboard/modules/mtg_submodule/mtg_submodule.dart';

class CardParserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.singleton((i) => CardParserBloc()),
      ];

  @override
  List<Module> get imports => [
        MtgSubmodule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          CardParserRoutes.base.name,
          child: (context, args) => const CardParserPage(),
        )
      ];
}

enum CardParserRoutes {
  base,
}

extension CardParserRouteNameExtension on CardParserRoutes {
  String get name {
    switch (this) {
      case CardParserRoutes.base:
        return '/';
    }
  }
}
