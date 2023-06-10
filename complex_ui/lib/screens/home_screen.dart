import 'package:complex_ui/screens/create_post_screen.dart';
import 'package:complex_ui/widgets/nagivation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          Expanded(
            child: ListView(
              children: [
                Text("data"),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: NavBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MyButtomSheet.showButtomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
