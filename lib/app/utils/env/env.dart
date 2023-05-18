import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'OPENAI_API_KEY')
  static const openAIApiKey = _Env.openAIApiKey;
}
