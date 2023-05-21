import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sideboard/core/constants/failure.dart';

abstract class OpenAIRepository {
  Future<Either<Failure, List<OpenAIModelModel>>> getModels();
  Future<Either<Failure, OpenAICompletionModel>> createCompletion(
    String prompt,
  );
}

class MockOpenAIRepository extends Mock implements OpenAIRepository {}
