import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

class OpenAIRepositoryImpl implements OpenAIRepository {
  @override
  Future<Either<Failure, List<OpenAIModelModel>>> getModels() async {
    try {
      return Right(await OpenAI.instance.model.list());
    } on RequestFailedException catch (e) {
      return Left(
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, OpenAICompletionModel>> createCompletion(
    String prompt,
  ) async {
    try {
      return Right(
        await OpenAI.instance.completion.create(
          prompt: prompt,
          model: 'text-davinci-003',
        ),
      );
    } on RequestFailedException catch (e) {
      return Left(
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, OpenAIChatCompletionModel>> createChatCompletion(
    List<OpenAIChatCompletionChoiceMessageModel> messages,
  ) async {
    try {
      return Right(
        await OpenAI.instance.chat.create(
          model: 'gpt-3.5-turbo',
          messages: messages,
        ),
      );
    } on RequestFailedException catch (e) {
      return Left(
        Failure.openAIRequestFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
