import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'life_counter_event.dart';
part 'life_counter_state.dart';

class LifeCounterBloc extends Bloc<LifeCounterEvent, LifeCounterState> {
  LifeCounterBloc() : super(LifeCounterInitial()) {
    on<LifeCounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
