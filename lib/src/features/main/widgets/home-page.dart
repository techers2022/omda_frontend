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
              MaterialPageRoute(builder: (_) => const SearchDoWorkPage()),
            );
          }
          break;

        case 2:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchGetWorkPage()),
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
        case 4:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchGetWorkPage()),
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
        backgroundColor: Colors.redAccent,
        title: const Text('App'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('LoginPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('RegisterPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('AboutPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('CustomerServicePage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CustomerServicePage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('SearchDoWorkPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchDoWorkPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('DetailedViewDoWorkPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const DetailedViewDoWorkPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('SearchGetWorkPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SearchGetWorkPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('DetailedViewGetWorkPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const DetailedViewGetWorkPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('PostWorkPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PostWorkPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //Navigation bar
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
          BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
              backgroundColor: Color(0xFFFFB300)),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
