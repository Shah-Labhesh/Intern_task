import 'package:flutter/material.dart';

class MyButtomSheet {
  static void showButtomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // ImagePicker(),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Caption..."),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          fixedSize: MaterialStateProperty.all(Size(180, 50))),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Upload",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue[900],
                          ),
                          fixedSize: MaterialStateProperty.all(Size(180, 50))),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
