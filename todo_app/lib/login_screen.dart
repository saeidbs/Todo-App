import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/todo_screen.dart';
import 'package:todo_app/utility/Values.dart';

import 'dataBase/dataManager/DataManager.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String passWord;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // test();
  }
  Future test() async {
    var test= await DataManager.createDateManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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

                onChanged: (text){
                  email=text;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: "password"),
                onChanged: (text){
                  passWord=text;
                },
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                title: "login",
                color: Colors.blueGrey,
                onPressed: () async {
                String realPassword;
                  realPassword=(await Values.dataManager.getUserDAO().getPassword(email: email.trim())).trim();

//                  final snackBar= SnackBar(
//                    content: Text("Hellow"),
//                   action: SnackBarAction(
//                     label: "Undo",
//                      onPressed: ()=> print("Undo"),
//                   ),
//                  );
//                  Scaffold.of(RoundedButton.buildContext).showSnackBar(snackBar);
                  if(realPassword==passWord) {
                    Values.logginUser=User(email: email.trim(),password: passWord.trim());
                    Navigator.pushNamed(context, TodoScreen.id);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
