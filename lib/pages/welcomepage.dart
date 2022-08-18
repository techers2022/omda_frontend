import 'dart:html';
import 'package:flutter/material.dart';
import 'package:omda_frontend/api.service.dart';
import 'package:omda_frontend/pages/categorylistpage.dart';
import 'package:omda_frontend/user.model.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child:
                        Image.asset('assets/imgs/house.png', fit: BoxFit.cover),
                  ),
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          color: const Color(0xFFFFB300),
                          alignment: Alignment.center,
                          child: Icon(Icons.favorite,
                              color: Colors.white, size: 130),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'OMDA - O mana de ajutor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Color(0xFFFFB300),
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'Enter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  splashColor:
                                      Color(0xFFFFB300).withOpacity(0.2),
                                  highlightColor:
                                      Color(0xFFFFB300).withOpacity(0.2),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryListPage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFFFB300),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Color(0xFFFFB300),
                                            width: 4)),
                                  )),
                            )))
                  ],
                ))
              ],
            )));
  }
}
