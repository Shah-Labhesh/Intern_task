import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/bloc/movie_bloc/movie_bloc.dart';
import 'package:task_2/bloc/movie_bloc/movie_event.dart';
import 'package:task_2/bloc/movie_bloc/movie_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    BlocProvider.of<MovieBloc>(context, listen: false).add(FetchMovieEvent());
  }

  static getImageUrl({required String poster}) {
    String url = "https://www.themoviedb.org/t/p/w220_and_h330_face";
    return url + poster;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is ErrorMovieState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SuccessHomeState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Movies",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final data = state.results[index];
                        return Card(
                          margin: EdgeInsets.all(20),

                          // color: Color(0xFFFFFEF2),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                        data.originalTitle,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        data.releaseDate,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Text(
                                          "view more",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue[900])),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ErrorMovieState) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MovieBloc>(context, listen: false)
                          .add(FetchMovieEvent());
                    },
                    child: Text("Try again")),
              );
            } else if (state is LoadingMovieState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text("data");
          },
        ),
      ),
    );
  }
}
