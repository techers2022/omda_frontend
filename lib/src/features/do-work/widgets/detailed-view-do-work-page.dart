import 'package:flutter/material.dart';

class DetailedViewDoWorkPage extends StatelessWidget {
  const DetailedViewDoWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
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
                        image: AssetImage('assets/images/gazon.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              left: 10,
              top: 15,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
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
                          'Dat cu grebla',
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
                            '250 Lei',
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
                            child: Text('Gradinarit'),
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
                            child: Text('2-3 ore'),
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
                      'Caut om pentru tuns gazon, ingrijit florile, luat frunzele platesc foarte bine, am nevoie de ajutor cat mai repede, nu i mult de locru, am roaba coasa foarfeca de toate ce traba',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
