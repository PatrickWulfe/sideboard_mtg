import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_module.dart';
import 'package:sideboard/modules/deck_generator/domain/use_cases/open_ai_create_completion_use_case.dart';

void main() {
  final mockRepository = MockOpenAIRepository();
  late OpenAICreateCompletionUseCase useCase;
  setUp(() {
    initModule(
      DeckGeneratorModule(),
      replaceBinds: [
        Bind.instance<OpenAIRepository>(mockRepository),
      ],
    );
    useCase = OpenAICreateCompletionUseCase(mockRepository);
  });
  test('Should get OpenAICompletionModel from the repository', () async {
    // arrange
    const prompt = 'Create a MTG deck for me.';
    final rv = dartz.Right<Failure, OpenAICompletionModel>(
      OpenAICompletionModel(
        id: '',
        created: DateTime.now(),
        model: '',
        choices: const [],
        usage: null,
      ),
    );
    when(() => mockRepository.createCompletion(prompt)).thenAnswer(
      (_) => Future.value(rv),
    );

    // act
    final result = await useCase.execute(prompt);

    // assert
    verify(() => mockRepository.createCompletion(prompt)).called(1);
    expect(result, equals(rv));
  });
}
