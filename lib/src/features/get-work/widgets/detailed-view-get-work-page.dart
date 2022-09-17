import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/get-work/widgets/search-get-work-page.dart';
import 'package:omda_frontend/src/features/main/widgets/home-page.dart';
import 'package:omda_frontend/src/features/profile/widgets/profile_page.dart';
import 'package:omda_frontend/src/features/profile/widgets/profile_widget.dart';

class DetailedViewGetWorkPage extends StatelessWidget {
  const DetailedViewGetWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 1.23,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/gigel.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 15,
                  child: Row(
                    children: [
                      InkWell(
                        hoverColor: Colors.black,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SearchGetWorkPage()),
                            );
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 580,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cant la nunti',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.lightBlue[700],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Oradea',
                                  style: TextStyle(
                                      color: Colors.lightBlue[700],
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '4.0',
                                    style: TextStyle(
                                        color: Colors.lightBlue[700],
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                              Text(
                                '5000 Lei',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.lightBlue[700],
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFFFB300)),
                              child: Center(
                                child: Text('Evenimente'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFFFB300)),
                              child: Center(
                                child: Text('7 ore'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFFFB300)),
                              child: Center(
                                child: Text('Oricand'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFFFB300)),
                              child: Center(
                                child: Text('Orice ora'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Descriere:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gigel si formatia canta la nunti, botezuri, zile de nastere si alte evenimente',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w100),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileWidget(
                              imagePath: "assets/images/gigel.jpg",
                              onClicked: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePage(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  "Gigel Frone",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "gigel_lautar@gmail.com",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFFB300)),
                                  child: Center(
                                    child: Text('Angajeaza'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                            )
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
