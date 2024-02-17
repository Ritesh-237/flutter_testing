part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterEvent {
  final int? value;

  const IncrementCounterEvent({required this.value});

  @override
  List<Object> get props => [];
}
