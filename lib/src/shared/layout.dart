import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/do-work/widgets/search-do-work-page.dart';
import 'package:omda_frontend/src/features/get-work/widgets/search-get-work-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/about-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/customer-service-page.dart';
import 'package:omda_frontend/src/features/main/widgets/home-page.dart';
import 'package:omda_frontend/src/features/my-works/widgets/my-works-page.dart';
import 'package:omda_frontend/src/features/post-work/widgets/post-work-page.dart';
import 'package:omda_frontend/src/features/profile/widgets/profile_page.dart';
import 'package:omda_frontend/src/shared/helper.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';
import 'package:omda_frontend/src/shared/user-data.dart';

class Layout {
  static AppBar appBar(BuildContext context, bool forPost) {
    return AppBar(
      // The search area here
      backgroundColor: ThemeColors.primary,
      actions: [
        IconButton(
          icon: Image.asset('assets/images/logoomdarb2.png'),
          iconSize: 60,
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
      bottom: forPost
          ? TabBar(
              indicatorColor: ThemeColors.secondary,
              tabs: const [
                Tab(text: "Caut ajutor"),
                Tab(text: "Ofer ajutor"),
              ],
            )
          : null,
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
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
              hintText: 'Caut??...',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  static Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/logoomdarb2.png",
                  ),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                color: ThemeColors.primary,
              ),
              child: const Text("")),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text('Profil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.assignment,
            ),
            title: const Text('Anun??urile mele'),
            onTap: () {
              if (UserData.id.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Text(
                      textAlign: TextAlign.center,
                      "Trebuie sa fi conectat cu un cont pentru a putea accesa aceast?? pagin??",
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyWorksPage(),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_page_rounded,
            ),
            title: const Text('Serviciu clien??i'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CustomerServicePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.volunteer_activism_rounded,
            ),
            title: const Text('Despre noi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Deconectare'),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  static BottomNavigationBar bottomNavigationBar(
      BuildContext context, currentIndex) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Acas??',
          backgroundColor: ThemeColors.primary,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.work_outline_rounded),
          label: 'Ofer?? ajutor',
          backgroundColor: ThemeColors.primary,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.engineering),
          label: 'Caut?? ajutor',
          backgroundColor: ThemeColors.primary,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add_to_photos),
          label: 'Adaug?? anun??',
          backgroundColor: ThemeColors.primary,
        ),
      ],
      currentIndex: currentIndex,
      onTap: (int index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            }
            break;

          case 1:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchDoWorkPage()),
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
              if (UserData.id.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Text(
                      textAlign: TextAlign.center,
                      "Trebuie sa fi conectat cu un cont pentru a putea ad??uga anun??uri",
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PostWorkPage()),
                );
              }
            }
            break;
          default:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            }
            break;
        }
      },
    );
  }
}
