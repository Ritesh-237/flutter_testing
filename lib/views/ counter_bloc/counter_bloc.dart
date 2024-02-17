import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState()) {
    on<IncrementCounterEvent>(_incrementCounter);
  }

  Future<void> _incrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) async {
    try {
      emit(IncrementLoadingState());
      double result = 100 / event.value!;
      emit(IncrementLoadedState(result: result));
    } catch (e) {
      emit(const IncrementFailureState(error: 'TypeCasting Failed'));
    }
  }
}
