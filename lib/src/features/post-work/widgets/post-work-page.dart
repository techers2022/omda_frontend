import 'package:flutter/material.dart';
import 'package:omda_frontend/src/shared/layout.dart';

class PostWorkPage extends StatelessWidget {
  const PostWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Layout.appBar(context),
      drawer: Layout.drawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Ai nevoie de ajutor?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Postează acum anunțul tău!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/need-help.png',
                height: 150,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Categorie',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gradinarit',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Descriere',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Caut persoană pentru tuns 100mp2 gazon.',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Preț',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8.0,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '100',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text('RON'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Dată estimativă',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 39, 59, 122),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 130,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '14/09/2022',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: FlatButton(
                    child: Text("Postează"),
                    onPressed: () {},
                    color: Colors.amber,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Layout.bottomNavigationBar(context, 3),
    );
  }
}
