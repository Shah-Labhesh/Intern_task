import 'package:flutter/material.dart';
import 'package:task_2/bloc/movie_bloc/movie_state.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  final SuccessHomeState state;
  final int index;

  static getImageUrl({required String poster}) {
    String url = "https://www.themoviedb.org/t/p/w220_and_h330_face";
    return url + poster;
  }

  @override
  Widget build(BuildContext context) {
    final data = state.results[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.originalTitle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(200, 0, 0, 0),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  getImageUrl(
                    poster: data.posterPath,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 22,
              right: 22,
              left: 22,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    data.originalTitle,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Released Date",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      data.releaseDate,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 22,
              top: 10,
            ),
            child: Text(
              "Overview",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              bottom: 22,
            ),
            child: Text(
              data.overview,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
