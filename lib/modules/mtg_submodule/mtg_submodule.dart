import 'package:flutter_modular/flutter_modular.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

class MtgSubmodule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => ScryfallApiClient(),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => ScryfallRepository(
            apiClient: i(),
          ),
          export: true,
        ),
      ];
}
