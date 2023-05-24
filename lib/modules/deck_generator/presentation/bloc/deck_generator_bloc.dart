import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';
import 'package:sideboard/modules/deck_generator/domain/use_cases/open_ai_create_chat_completion_use_case.dart';
import 'package:sideboard/modules/deck_generator/domain/use_cases/open_ai_create_completion_use_case.dart';

part 'deck_generator_bloc.freezed.dart';
part 'deck_generator_event.dart';
part 'deck_generator_state.dart';

class DeckGeneratorBloc
    extends HydratedBloc<DeckGeneratorEvent, DeckGeneratorState> {
  DeckGeneratorBloc({
    required OpenAIRepository openAIRepository,
  })  : _openAIRepository = openAIRepository,
        super(
          const _Initial(
            aiMessages: [],
          ),
        ) {
    // Initialize use cases
    _openAICreateCompletionUseCase =
        OpenAICreateCompletionUseCase(repository: _openAIRepository);
    _openAICreateChatCompletionUseCase =
        OpenAICreateChatCompletionUseCase(repository: _openAIRepository);

    on<DeckGeneratorEvent>((event, emit) async {
      await event.when(
        started: () {},
        submission: (prompt) async {
          final messages = [
            ...state.aiMessages,
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.user,
              content: prompt,
            ),
          ];
          emit(state.copyWith(aiMessages: messages));
          final result =
              await _openAICreateChatCompletionUseCase.execute(messages);
          result.fold(
            (l) => null,
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
        },
      );
    });
  }
  final OpenAIRepository _openAIRepository;

  late final OpenAICreateCompletionUseCase _openAICreateCompletionUseCase;
  late final OpenAICreateChatCompletionUseCase
      _openAICreateChatCompletionUseCase;

  @override
  DeckGeneratorState? fromJson(Map<String, dynamic> json) {
    return DeckGeneratorState.fromMap(json as Map<String, Object>);
  }

  @override
  Map<String, dynamic>? toJson(DeckGeneratorState state) {
    return state.toMap();
  }
}
