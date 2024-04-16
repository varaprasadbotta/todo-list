import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String buttonName;
  void Function()? onPressed;
   Mybutton({super.key,required this.buttonName,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: onPressed,
      child:  Text(
        buttonName,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
