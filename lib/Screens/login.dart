import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonPressed = false;
  bool validateForm = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonPressed = true;
      });
      await Future.delayed(Duration(milliseconds: 250));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        buttonPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/login_img.png'),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 30.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Username"),
                        hintText: "Type your username",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Type your password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(buttonPressed ? 40 : 8),
                      child: InkWell(
                        splashColor: Colors.cyan,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          alignment: Alignment.center,
                          height: 40,
                          width: buttonPressed ? 40 : 140,
                          child: buttonPressed
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
