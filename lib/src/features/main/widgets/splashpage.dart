import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      body: Container(
          color: Color(0xFFFFB300),
          alignment: Alignment.center,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logoomdarb.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'OMDA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 27, 25, 25),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ])),
    );
  }
}
