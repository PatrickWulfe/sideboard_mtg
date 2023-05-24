import 'package:flutter_modular/flutter_modular.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgSubmodule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ScryfallApiClient(), export: true),
      ];
}
