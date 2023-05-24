import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sideboard/bootstrap.dart';
import 'package:sideboard/core/env/env.dart';
import 'package:sideboard/firebase_options.dart';
import 'package:sideboard/modules/app/app_index.dart';

Future<void> main() async {
  await bootstrap(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getApplicationDocumentsDirectory(),
      );
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      OpenAI.apiKey = Env.openAIApiKey;

      return ModularApp(
        module: AppModule(),
        child: const App(),
      );
    },
  );
}
