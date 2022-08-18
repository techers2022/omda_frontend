import 'dart:html';
import 'package:flutter/material.dart';
import 'package:omda_frontend/api.service.dart';
import 'package:omda_frontend/pages/splashpage.dart';
import 'package:omda_frontend/pages/welcomepage.dart';
import 'package:omda_frontend/user.model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 2,
      goToPage: WelcomePage(),
    ),
  ));
}
