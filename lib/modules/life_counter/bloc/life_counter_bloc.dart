import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'life_counter_event.dart';
part 'life_counter_state.dart';
part 'life_counter_bloc.freezed.dart';

class LifeCounterBloc extends Bloc<LifeCounterEvent, LifeCounterState> {
  LifeCounterBloc() : super(_Initial()) {
    on<LifeCounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
