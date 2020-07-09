import 'package:flutter/material.dart';
import 'package:login_app/components/createText.dart';
import 'package:login_app/helpers/FadeRoute.dart';
import 'package:login_app/screens/WelcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView(
        children: [
          SizedBox(
            height: 80,
          ),
          CreateText(
              "Hysys >", Colors.blue, 25, FontWeight.bold, TextAlign.left),
          SizedBox(
            height: 5,
          ),
          CreateText("Employee Login", Colors.black, 16, FontWeight.w500,
              TextAlign.left),
          SizedBox(
            height: 35,
          ),
          CreateText(
              "Welcome!", Colors.black, 50, FontWeight.w300, TextAlign.left),
          SizedBox(
            height: 10,
          ),
          CreateText("Please Sign-in to continue", Colors.black, 22,
              FontWeight.w300, TextAlign.left),
          SizedBox(
            height: 30,
          ),
          _createForm(),
          SizedBox(
            height: 20,
          ),
          _createLoginButton(),
        ],
      ),
    );
  }


  Widget _createForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "Email address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hoverColor: Colors.blue),
            style: TextStyle(fontSize: 20),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hoverColor: Colors.blue,
              suffixIcon: _createForgotPasswordButton(),
            ),
            style: TextStyle(fontSize: 20),
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  Widget _createLoginButton() {
    return Row(
      children: [
        Container(
          width: 150,
          height: 50,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                FadeRoute(page: WelcomeScreen()),
              );
            },
            color: Colors.blueAccent.shade400,
            shape: StadiumBorder(),
            child: CreateText("Sign In", Colors.white, 20, FontWeight.normal,
                TextAlign.center),
          ),
        ),
      ],
    );
  }

  Widget _createForgotPasswordButton() {
    return GestureDetector(
      onTap: () {
        print("You clicked forgot password button.");
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: CreateText("Forgot Password ?", Colors.blue, 15,
            FontWeight.normal, TextAlign.center),
      ),
    );
  }
}
