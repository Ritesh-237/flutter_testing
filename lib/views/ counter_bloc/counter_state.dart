part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitialState extends CounterState {
  const CounterInitialState();

  @override
  List<Object> get props => [];
}

class IncrementLoadingState extends CounterState {}

class IncrementLoadedState extends CounterState {
  final double result;

  const IncrementLoadedState({required this.result});

  @override
  List<Object> get props => [result];
}

class IncrementFailureState extends CounterState {
  final String error;
  const IncrementFailureState({required this.error});

  @override
  List<Object> get props => [];
}
