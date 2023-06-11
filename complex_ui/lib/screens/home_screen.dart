import 'dart:convert';

import 'package:complex_ui/models/users.dart';
import 'package:complex_ui/widgets/nagivation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/posts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchUserData();

    super.initState();
  }

  fetchUserData() async {
    try {
      var jsonString = await rootBundle.loadString("assets/json/data.json");
      var data = jsonDecode(jsonString);
      var userData = data["users"];
      UserModel.user =
          List.from(userData).map((user) => Users.fromJson(user)).toList();
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Social Media",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
            (UserModel.user.isEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      itemCount: UserModel.user.length,
                      itemBuilder: (context, index) {
                        Users user = UserModel.user[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (Posts post in user.posts)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.person_crop_circle,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            user.name,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          child: Text(
                                            post.caption,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 220,
                                          width: 320,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                post.image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 320,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(CupertinoIcons.suit_heart),
                                              Text("Like"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(CupertinoIcons
                                                  .captions_bubble),
                                              Text("Comment"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(CupertinoIcons.bookmark),
                                              Text("Save"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(CupertinoIcons
                                                  .arrowshape_turn_up_right),
                                              Text("Share"),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ],
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
