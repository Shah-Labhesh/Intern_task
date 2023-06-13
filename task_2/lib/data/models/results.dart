class MovieResult {
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;

  MovieResult({
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  MovieResult.fromJson(Map<String, dynamic> json) {
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
