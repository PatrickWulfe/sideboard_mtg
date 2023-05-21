import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/bootstrap.dart';
import 'package:sideboard/core/env/env.dart';
import 'package:sideboard/firebase_options.dart';
import 'package:sideboard/modules/app/app_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OpenAI.apiKey = Env.openAIApiKey;

  await bootstrap(
    () => ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
