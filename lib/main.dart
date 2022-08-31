import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/main/widgets/splashpage.dart';
import 'package:omda_frontend/src/features/main/widgets/home-page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 2,
      goToPage: HomePage(),
    ),
  ));
}
