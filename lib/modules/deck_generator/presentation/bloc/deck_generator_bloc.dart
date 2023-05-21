import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';
import 'package:sideboard/modules/deck_generator/domain/use_cases/open_ai_create_completion_use_case.dart';

part 'deck_generator_bloc.freezed.dart';
part 'deck_generator_event.dart';
part 'deck_generator_state.dart';

class DeckGeneratorBloc extends Bloc<DeckGeneratorEvent, DeckGeneratorState> {
  DeckGeneratorBloc({
    required OpenAIRepository openAIRepository,
  })  : _openAIRepository = openAIRepository,
        super(const _Initial(response: '')) {
    // Initialize use cases
    _openAICreateCompletionUseCase =
        OpenAICreateCompletionUseCase(_openAIRepository);

    on<DeckGeneratorEvent>((event, emit) {
      event.when(
        started: () {},
        submission: (prompt) async {
          final result = await _openAICreateCompletionUseCase.execute(prompt);
          result.fold(
            (l) => null,
            (r) => emit(state.copyWith(response: r.choices.first.text)),
          );
        },
      );
    });
  }
  final OpenAIRepository _openAIRepository;

  late final OpenAICreateCompletionUseCase _openAICreateCompletionUseCase;
}
