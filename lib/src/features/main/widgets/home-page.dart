import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/authentication/widgets/login-page.dart';
import 'package:omda_frontend/src/features/authentication/widgets/register-page.dart';
import 'package:omda_frontend/src/features/do-work/widgets/detailed-view-do-work-page.dart';
import 'package:omda_frontend/src/features/do-work/widgets/search-do-work-page.dart';
import 'package:omda_frontend/src/features/get-work/widgets/detailed-view-get-work-page.dart';
import 'package:omda_frontend/src/features/get-work/widgets/search-get-work-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/about-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/customer-service-page.dart';
import 'package:omda_frontend/src/features/post-work/widgets/post-work-page.dart';
import 'package:omda_frontend/src/features/profile/widgets/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Selectia unei pagini din navigation bar
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
          break;

        case 1:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchGetWorkPage()),
            );
          }
          break;

        case 2:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchDoWorkPage()),
            );
          }
          break;
        case 3:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PostWorkPage()),
            );
          }
          break;
        default:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
          // The search area here
          backgroundColor: Color(0xFFFFB300),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/logoomdarb.png'),
              iconSize: 60,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
          title: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      //navigatia drawer colt staga sus
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logoomdarb.png",
                    ),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomRight),
                color: Color(0xFFFFB300),
              ),
              child: Text(
                'Drawer Header',
                textAlign: TextAlign.justify,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_page_rounded,
              ),
              title: const Text('Customer Service'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CustomerServicePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.volunteer_activism_rounded,
              ),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      // page content
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
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    height: 150,
                    child: InkWell(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'assets/images/gardeningcat.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent
                                      ])),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        color: Colors.red,
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.favorite,
                                            color: Colors.white, size: 30),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Gradinarit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchGetWorkPage()),
                        );
                      },
                    ),
                  );
                }),
          )
        ],
      )),

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFFFFB300)),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded),
              label: 'Do-work',
              backgroundColor: Color(0xFFFFB300)),
          BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: 'Get-work',
              backgroundColor: Color(0xFFFFB300)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos),
              label: 'Add Job',
              backgroundColor: Color(0xFFFFB300)),
        ],
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
