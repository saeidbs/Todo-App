import 'package:flutter/material.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/todo_screen.dart';
import 'package:todo_app/utility/Values.dart';

import 'components/rounded_button.dart';
import 'constants.dart';
import 'dataBase/dataManager/DataManager.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String passWord;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  test();
  }

  Future test() async {
    var test = await DataManager.createDateManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Your email"),
                onChanged: (text) {
                  email = text;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: "password"),
                onChanged: (text) {
                  passWord = text;
                },
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                title: "Register",
                color: Colors.blueGrey,
                onPressed: () async {
                  int saeid = await Values.dataManager
                      .getUserDAO()
                      .add(email: email.trim(), passWord: passWord.trim());
                  Values.logginUser =
                      User(email: email.trim(), password: passWord.trim());
                  Navigator.pushNamed(context, TodoScreen.id);

                  print(saeid);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
