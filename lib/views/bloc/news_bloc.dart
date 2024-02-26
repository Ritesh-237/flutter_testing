import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

/* 

*NOTE : listener is only called once for each state change

*/

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsStateInitial()) {
    on<GetNewsEvent>(_geNewsEvent);
  }

  Future<void> _geNewsEvent(GetNewsEvent event, Emitter<NewsState> emit) async {
    try {
      emit(const NewsLoadingState());
      int result = 2 * 100;
      emit(NewsLoadedState(result: result));
    } catch (e) {
      emit(NewsFailureState(error: e.toString()));
    }
  }
}

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsStateInitial());

  void performOperation() {
    try {
      emit(const NewsLoadingState());
      int result = 2 * 100;
      emit(NewsLoadedState(result: result));
    } catch (e) {
      emit(NewsFailureState(error: e.toString()));
    }
  }
}
