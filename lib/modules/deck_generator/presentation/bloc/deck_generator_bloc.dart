import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/modules/deck_generator/deck_generator_index.dart';

part 'deck_generator_bloc.freezed.dart';
part 'deck_generator_event.dart';
part 'deck_generator_state.dart';

class DeckGeneratorBloc extends Bloc<DeckGeneratorEvent, DeckGeneratorState> {
  DeckGeneratorBloc({
    required OpenAIRepository openAIRepository,
  })  : _openAIRepository = openAIRepository,
        super(const _Initial()) {
    on<DeckGeneratorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  late final OpenAIRepository _openAIRepository;
}
