import 'package:task_2/data/models/results.dart';

class Movie {
  late List<MovieResult> results;

  Movie({required this.results});

  Movie.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as List<dynamic>)
        .map((v) => MovieResult.fromJson(v as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}
