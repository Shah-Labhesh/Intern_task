import 'package:task_2/data/models/results.dart';

abstract class MovieState {}

class InitialMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class SuccessHomeState extends MovieState {
  List<MovieResult> results;
  SuccessHomeState({
    required this.results,
  });
}

class ErrorMovieState extends MovieState {
  String errorMessage;
  ErrorMovieState({
    required this.errorMessage,
  });
}
