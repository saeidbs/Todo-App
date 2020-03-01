import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/todo_screen.dart';

import 'dataBase/dataManager/DataManager.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
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
              RoundedButton(
                title: "login",
                color: Colors.blueGrey,
                onPressed: () {
                  final snackBar= SnackBar(
                    content: Text("Hellow"),
                   action: SnackBarAction(
                     label: "Undo",
                      onPressed: ()=> print("Undo"),
                   ),
                  );
                  Scaffold.of(RoundedButton.buildContext).showSnackBar(snackBar);

                  Navigator.pushNamed(context, TodoScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
