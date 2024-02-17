part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNewsEvent extends NewsEvent {
  const GetNewsEvent();
  @override
  List<Object> get props => [];
}

class CounterIncrementEvent extends NewsState {
  final int value;
  const CounterIncrementEvent({required this.value});

  @override
  List<Object> get props => [value];
}
