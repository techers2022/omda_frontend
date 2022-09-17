import 'package:flutter/material.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';

class SplashPage extends StatelessWidget {
  final int duration;
  final Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: duration),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => goToPage),
        );
      },
    );

    return Scaffold(
      body: Container(
          color: ThemeColors.primary,
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
                        "assets/images/logoomdarb2.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'OMDA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
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
