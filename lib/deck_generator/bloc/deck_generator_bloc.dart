import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'deck_generator_event.dart';
part 'deck_generator_state.dart';

class DeckGeneratorBloc extends Bloc<DeckGeneratorEvent, DeckGeneratorState> {
  DeckGeneratorBloc() : super(DeckGeneratorInitial()) {
    on<DeckGeneratorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
