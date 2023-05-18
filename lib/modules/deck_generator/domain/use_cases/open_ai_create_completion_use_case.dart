import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';
import 'package:sideboard_mtg/core/constants/failure.dart';
import 'package:sideboard_mtg/modules/deck_generator/deck_generator_index.dart';

class OpenAICreateCompletionUseCase {
  OpenAICreateCompletionUseCase(this.repository);

  final OpenAIRepository repository;

  Future<Either<Failure, OpenAICompletionModel>> execute(String prompt) {
    return repository.createCompletion(prompt);
  }
}
