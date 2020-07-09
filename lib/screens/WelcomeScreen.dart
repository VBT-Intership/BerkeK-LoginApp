import 'package:flutter/material.dart';
import 'package:login_app/components/createText.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _createBody(),
    );
  }

  Widget _createBody(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          _createIcon(),
          SizedBox(height: 20,),
          CreateText("Sign in successful!", Colors.black, 20, FontWeight.w300,TextAlign.center),
          SizedBox(height: 20,),
          CreateText("Welcome to Hysys", Colors.black, 35, FontWeight.w400,TextAlign.center),
      ],
      ),
    );
  }

  Widget _createIcon(){
    return Image.asset("assets/success_icon.png",height: 125,);
  }

}