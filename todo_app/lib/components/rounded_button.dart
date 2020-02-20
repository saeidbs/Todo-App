import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.title,this.color,@required this.onPressed});
  final String title;
  final Color color;
  final Function onPressed;

  static BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext=context;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1),
      child: Material(
        elevation: 1,
        color: color,
        borderRadius: BorderRadius.circular(32.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),

      ),
    );
  }
}