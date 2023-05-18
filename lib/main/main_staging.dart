import 'package:dart_openai/openai.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard_mtg/bootstrap.dart';
import 'package:sideboard_mtg/core/env/env.dart';
import 'package:sideboard_mtg/modules/app/app_index.dart';

void main() {
  OpenAI.apiKey = Env.openAIApiKey;
  bootstrap(
    () => ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
