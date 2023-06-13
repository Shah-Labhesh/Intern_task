// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task_2/bloc/movie_bloc/movie_state.dart';
import 'package:task_2/data/models/results.dart';
import 'package:task_2/screens/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.data,
    required this.state,
    required this.index,
  }) : super(key: key);

  final MovieResult data;
  final SuccessHomeState state;
  final int index;

  static getImageUrl({required String poster}) {
    String url = "https://www.themoviedb.org/t/p/w220_and_h330_face";
    return url + poster;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: Color(0xFFFFFEF2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    getImageUrl(
                      poster: data.posterPath,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    data.originalTitle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  )),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Text(
                  //   data.releaseDate,
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(state: state, index: index),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Text(
                        "View more",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
