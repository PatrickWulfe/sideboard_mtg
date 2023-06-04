import 'package:dart_openai/dart_openai.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sideboard/core/constants/failure.dart';

abstract class OpenAIRepository {
  Future<(Failure?, List<OpenAIModelModel>?)> getModels();
  Future<(Failure?, OpenAICompletionModel?)> createCompletion(
    String prompt,
  );
  Future<(Failure?, OpenAIChatCompletionModel?)> createChatCompletion(
    List<OpenAIChatCompletionChoiceMessageModel> messages,
  );
}

class MockOpenAIRepository extends Mock implements OpenAIRepository {}
