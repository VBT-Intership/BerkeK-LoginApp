import 'package:flutter/material.dart';
import 'package:login_app/screens/WelcomeScreen.dart';

import 'screens/LoginScreen.dart';

void main() {
    runApp(MaterialApp(
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        accentColor: Colors.black,
    ),
    routes: {
      "/": (context) => LoginScreen(),
      "/welcome": (context) => WelcomeScreen(),
    },
  ));
}
