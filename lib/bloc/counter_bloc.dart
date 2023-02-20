import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const _Initial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.when(
          initial: () => const CounterState.running(0),
          running: (number) {
            return event.when(
                incerement: () => CounterState.running(number + 1),
                decerement: () => CounterState.running(number - 1));
          }));
    });
  }
}
