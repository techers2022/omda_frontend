import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Choose category',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      )),
    );
  }
}
