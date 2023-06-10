import 'package:flutter/material.dart';

class MyButtomSheet {
  static void showButtomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              // ImagePicker(),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  // Perform delete action
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900])),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
