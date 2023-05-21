import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

class OpenAIRepositoryImpl implements OpenAIRepository {
  @override
  Future<Either<Failure, List<OpenAIModelModel>>> getModels() async {
    try {
      return Right(await OpenAI.instance.model.list());
    } on Exception {
      return Left(Failure());
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
    } on Exception {
      return Left(Failure());
    }
  }
}
