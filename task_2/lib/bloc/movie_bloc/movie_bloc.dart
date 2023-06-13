import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/bloc/movie_bloc/movie_event.dart';
import 'package:task_2/bloc/movie_bloc/movie_state.dart';
import 'package:task_2/data/repositories/movie_api.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(InitialMovieState()) {
    on<FetchMovieEvent>((event, emit) => fetchMovieData(emit));
  }

  void fetchMovieData(Emitter emit) async {
    emit(LoadingMovieState());
    try {
      var data = await MovieAPI().fetchMovieDetails();
      emit(SuccessHomeState(results: data.results));
    } catch (e) {
      emit(ErrorMovieState(errorMessage: e.toString()));
    }
  }
}
