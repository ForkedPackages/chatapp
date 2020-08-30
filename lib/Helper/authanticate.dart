import 'package:chatapp/Views/signin.dart';
import 'package:chatapp/Views/signup.dart';
import "package:flutter/material.dart";

class Authanticate extends StatefulWidget {
  @override
  _AuthanticateState createState() => _AuthanticateState();
}
class _AuthanticateState extends State<Authanticate> {
bool checksingIn = true;
void signingSwitch()
{
  setState(() {
    checksingIn = !checksingIn;
  });
}
  @override
  Widget build(BuildContext context) {
    if(checksingIn)
    return Signin(signingSwitch);
    else
    return SignUp(signingSwitch);
  }
}