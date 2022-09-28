import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/authentication/widgets/login-page.dart';
import 'package:omda_frontend/src/features/main/widgets/category.dart';
import 'package:omda_frontend/src/features/main/widgets/data.dart';

void logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false);
}

String getCategoryImage(String category) {
  List<Category> categories = Data.getMockedCategories();

  for (var i = 0; i < categories.length; i++) {
    if (category == categories[i].name) {
      return "assets/images/${categories[i].imgname}.jpg";
    }
  }
  
  return "assets/images/background3.png";
}
