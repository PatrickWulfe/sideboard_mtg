import 'package:dart_openai/openai.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/bootstrap.dart';
import 'package:sideboard/core/env/env.dart';
import 'package:sideboard/modules/app/app_index.dart';

void main() {
  OpenAI.apiKey = Env.openAIApiKey;
  bootstrap(
    () => ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
