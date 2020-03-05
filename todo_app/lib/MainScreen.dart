import 'package:flutter/material.dart';
import 'package:todo_app/RegisterScreen.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/login_screen.dart';

import 'dataBase/dataManager/DataManager.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        title: Text('Main Screen'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RoundedButton(
                title: "Register",
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                title: "Login",
                color: Colors.lightBlueAccent,
                onPressed: (){
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
