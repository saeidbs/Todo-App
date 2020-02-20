import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Your email"),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: "password"),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  elevation: 1,
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32.0),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 42,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
