import 'package:flutter/material.dart';
import 'package:login_app/components/createText.dart';
import 'package:login_app/helpers/FadeRoute.dart';
import 'package:login_app/networkOperations/UserOperations.dart';
import 'package:login_app/screens/WelcomeScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtMail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  UserOperations userOperations = new UserOperations();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
          SizedBox(
            height: 20,
          ),
          isLoading
              ? Text(
                  "Yükleniyor...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                )
              : Text("")
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
            controller: txtMail,
            validator: (value) {
              if (value.length < 2) {
                return "Please fill in the this area";
              }
              return null;
            },
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
            controller: txtPassword,
            obscureText: true,
            validator: (value) {
              if (value.length < 2) {
                return "Please fill in the this area";
              }
              return null;
            },
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
              setState(() {
                isLoading = true;
              });
              _loginOperation(txtMail.text, txtPassword.text);
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

  void _loginOperation(String username, String password) {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      userOperations.loginUser(username, password).then((value) => {
            /* Login Success */
            if (value.length >= 1)
              {
                Navigator.push(
                  context,
                  FadeRoute(page: WelcomeScreen()),
                )
              }
            else
              {_onAlertButtonPressed(context)}
          });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }

  /* Show error alert */
  _onAlertButtonPressed(context) {
    setState(() {
      isLoading = false;
    });
    Alert(
      context: context,
      type: AlertType.error,
      title: "Hatalı Şifre",
      desc: "Şifreyi Yanlış Girdiniz.",
      buttons: [
        DialogButton(
          child: Text(
            "Tamam",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
