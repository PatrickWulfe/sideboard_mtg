import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard_mtg/bootstrap.dart';
import 'package:sideboard_mtg/modules/app/app_index.dart';

void main() {
  bootstrap(
    () => ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
