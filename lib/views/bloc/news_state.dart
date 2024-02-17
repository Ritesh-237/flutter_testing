part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props => [];
}

class NewsStateInitial extends NewsState {
  const NewsStateInitial();
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  const NewsLoadingState();
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  final int result;
  const NewsLoadedState({required this.result});

  @override
  List<Object> get props => [result];
}

class NewsFailureState extends NewsState {
  final String error;
  const NewsFailureState({required this.error});
  @override
  List<Object> get props => [error];
}
