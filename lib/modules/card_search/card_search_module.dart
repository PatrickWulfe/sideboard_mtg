import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:sideboard/modules/card_search/bloc/card_search_bloc.dart';
import 'package:sideboard/modules/mtg_submodule/mtg_submodule.dart';

class CardSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.singleton((i) => CardSearchBloc()),
      ];

  @override
  List<Module> get imports => [
        MtgSubmodule(),
      ];

  @override
  List<ModularRoute> get routes => [];
}
