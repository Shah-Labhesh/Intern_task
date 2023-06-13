import 'package:dio/dio.dart';
import 'package:task_2/data/models/movie.dart';

import '../../constant/api.dart';

class MovieAPI {
  final dio = Dio();

  Future<Movie> fetchMovieDetails() async {
    var response = await dio.get(api);
    print(response.data.runtimeType);
    print(response.data);
    return Movie.fromJson(response.data);
  }
}
