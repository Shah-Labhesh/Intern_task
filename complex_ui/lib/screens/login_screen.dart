import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/users.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool change = false;
  bool _hide = true;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  fetchUserData() async {
    var jsonString = await rootBundle.loadString("assets/json/data.json");
    var data = jsonDecode(jsonString);
    var userData = data["users"];
    UserModel.user =
        List.from(userData).map((user) => Users.fromJson(user)).toList();

    print(UserModel.user.length);
  }

  void loginValidate() async {
    String email = _controller1.text.toLowerCase();
    String password = _controller2.text;

    if (_formKey.currentState!.validate()) {
      setState(() {
        change = true;
      });
      for (var user in UserModel.user) {
        if (email == user.email.toLowerCase().toString()) {
          print(email);
          print(user.email);
          print(password);
          print(user.password);
          if (password == user.password) {
            await Future.delayed(Duration(seconds: 2));
            Navigator.pushNamed(context, '/home');
            _controller1.clear();
            _controller2.clear();
            setState(() {
              change = false;
            });
            return;
          }
        }
      }
      setState(() {
        change = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Incorrect email or password",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7.5,
                  decoration: BoxDecoration(color: Colors.blue[900]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 16),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                            fixedSize: MaterialStateProperty.all(Size(140, 40)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 140),
                    child: Center(
                      child: Text(
                        "Social Media",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Enter your details below",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _controller1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                          ),
                          label: Text(
                            "Email",
                          ),
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(154, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "shahlabhesh@gmail.com",
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(154, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email is empty";
                          } else if (!value.contains('@')) {
                            return "email should contain @";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            obscureText: _hide,
                            controller: _controller2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                              ),
                              label: Text(
                                "Password",
                              ),
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(154, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: "********",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(154, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is empty";
                              } else if (value.length < 8) {
                                return "Password length should be more then 8";
                              }
                              return null;
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _hide = !_hide;
                                });
                              },
                              icon: _hide
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          loginValidate();
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: 60,
                          width: change ? 200 : 360,
                          child: Center(
                            child: change
                                ? Text(
                                    "Loading...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                          ),
                          decoration: BoxDecoration(
                            color: change ? Colors.lightBlue : Colors.blue[900],
                            borderRadius: change
                                ? BorderRadius.circular(100)
                                : BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
