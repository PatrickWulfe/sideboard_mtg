import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late OpenAIRepository mockRepository;
  late Storage storage;

  setUp(() async {
    mockRepository = MockOpenAIRepository();

    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenAnswer((_) async => null);
    HydratedBloc.storage = storage;

    initModule(
      DeckGeneratorModule(),
      replaceBinds: [
        Bind.instance<OpenAIRepository>(mockRepository),
      ],
    );
  });

  group('DeckGeneratorBloc', () {
    blocTest<DeckGeneratorBloc, DeckGeneratorState>(
      'emits',
      build: () => DeckGeneratorBloc(openAIRepository: mockRepository),
      expect: () => [isA<DeckGeneratorState>()],
    );
  });
}
