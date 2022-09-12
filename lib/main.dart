import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/authentication/widgets/login-page.dart';
import 'package:omda_frontend/src/features/main/widgets/splashpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      //brightness: Brightness.light,
      primaryColor: Colors.amber,
      //fontFamily: 'Georgia',
      // textTheme: const TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
    ),
   home: SplashPage(
      duration: 2,
      goToPage: const LoginPage(),
    ),
  ));
}
