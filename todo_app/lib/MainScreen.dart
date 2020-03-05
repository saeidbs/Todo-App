import 'package:animated_text_kit/animated_text_kit.dart';
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

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      if(animation.isCompleted)
        controller.reverse();
      setState(() {});
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['Todo App'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
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
