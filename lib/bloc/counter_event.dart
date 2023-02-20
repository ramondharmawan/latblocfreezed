part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.incerement() = _Increment;
  const factory CounterEvent.decerement() = _decrement;
}
