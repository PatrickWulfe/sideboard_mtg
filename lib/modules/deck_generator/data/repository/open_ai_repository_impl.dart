import 'package:dart_openai/dart_openai.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

class OpenAIRepositoryImpl implements OpenAIRepository {
  @override
  Future<(Failure?, List<OpenAIModelModel>?)> getModels() async {
    try {
      return (null, await OpenAI.instance.model.list());
    } on RequestFailedException catch (e) {
      return (
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
        null
      );
    }
  }

  @override
  Future<(Failure?, OpenAICompletionModel?)> createCompletion(
    String prompt,
  ) async {
    try {
      return (
        null,
        await OpenAI.instance.completion.create(
          prompt: prompt,
          model: 'text-davinci-003',
        ),
      );
    } on RequestFailedException catch (e) {
      return (
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
        null
      );
    }
  }

  @override
  Future<(Failure?, OpenAIChatCompletionModel?)> createChatCompletion(
    List<OpenAIChatCompletionChoiceMessageModel> messages,
  ) async {
    try {
      return (
        null,
        await OpenAI.instance.chat.create(
          model: 'gpt-3.5-turbo',
          messages: messages,
        ),
      );
    } on RequestFailedException catch (e) {
      return (
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
        null
      );
    }
  }
}
