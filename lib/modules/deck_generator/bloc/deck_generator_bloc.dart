import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

part 'deck_generator_bloc.freezed.dart';
part 'deck_generator_event.dart';
part 'deck_generator_state.dart';

class DeckGeneratorBloc
    extends HydratedBloc<DeckGeneratorEvent, DeckGeneratorState> {
  DeckGeneratorBloc({
    required OpenAIRepository openAIRepository,
  })  : _openAIRepository = openAIRepository,
        super(const _Normal(aiMessages: [])) {
    on<DeckGeneratorEvent>((event, emit) async {
      await event.when(
        started: () {},
        submission: (prompt) async {
          await _onSubmission(prompt, emit);
        },
      );
    });
  }

  Future<void> _onSubmission(
    String prompt,
    Emitter<DeckGeneratorState> emit,
  ) async {
    final messages = [
      ...state.aiMessages,
      OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.user,
        content: prompt,
      ),
    ];
    emit(state.copyWith(aiMessages: messages));
    final result = await _openAIRepository.createChatCompletion(messages);
    result.fold(
      (l) => emit(
        DeckGeneratorState.failure(
          aiMessages: state.aiMessages,
          error: l,
        ),
      ),
      (r) {
        final stateMessages = [
          ...messages,
          r.choices.first.message,
        ];
        emit(
          state.copyWith(
            aiMessages: stateMessages,
          ),
        );
      },
    );
  }

  final OpenAIRepository _openAIRepository;

  @override
  DeckGeneratorState? fromJson(Map<String, dynamic> json) {
    return DeckGeneratorState.fromMap(json as Map<String, Object>);
  }

  @override
  Map<String, dynamic>? toJson(DeckGeneratorState state) {
    return state.toMap();
  }
}
