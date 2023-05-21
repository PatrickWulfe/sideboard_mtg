import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

class OpenAICreateChatCompletionUseCase {
  OpenAICreateChatCompletionUseCase({
    required OpenAIRepository repository,
  }) : _repository = repository;

  final OpenAIRepository _repository;

  Future<Either<Failure, OpenAIChatCompletionModel>> execute(
    List<OpenAIChatCompletionChoiceMessageModel> messages,
  ) {
    return _repository.createChatCompletion(messages);
  }
}
