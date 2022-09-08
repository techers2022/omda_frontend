import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/authentication/widgets/login-page.dart';
import 'package:omda_frontend/src/features/do-work/widgets/detailed-view-do-work-page.dart';
import 'package:omda_frontend/src/features/get-work/widgets/search-get-work-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/about-page.dart';
import 'package:omda_frontend/src/features/info-app/widgets/customer-service-page.dart';
import 'package:omda_frontend/src/features/post-work/widgets/post-work-page.dart';
import 'package:omda_frontend/src/features/main/widgets/home-page.dart';
import 'package:omda_frontend/src/features/profile/widgets/profile-page.dart';
import 'package:omda_frontend/src/features/do-work/widgets/do_work_job.dart';
import 'package:omda_frontend/src/features/do-work/widgets/jobs_data.dart';

class SearchDoWorkPage extends StatelessWidget {
  SearchDoWorkPage({Key? key}) : super(key: key);
  List<DoWorkJobs> jobs = JobsData.getMockedJobs();
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
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          }
          break;
      }
    }

    String dropdownvalue = 'Categorii';
    String dropdownvalue2 = 'Sorteaza';

    // List of items in our dropdown menu
    var items = [
      'Categorii',
      'Gradinarit',
      'IT',
      'Carat',
      'Constructii',
      'Design',
    ];
    var items2 = [
      'Sorteaza',
      'Pret',
      'Durata',
      'Data',
    ];
    SearchGetWorkPage createState() => const SearchGetWorkPage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
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
                  MaterialPageRoute(builder: (_) => HomePage()),
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
            ListTile(
              leading: Icon(
                Icons.login,
              ),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      // page content

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    width: 90,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFFB300)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue,
                            // Down Arrow Icon
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                            ),
                            underline: SizedBox(),
                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                            style: TextStyle(
                                //te
                                color: Colors.white, //Font color
                                fontSize: 15 //font size on dropdown button
                                ),
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Color(0xFFFFB300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    width: 90,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFFB300)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue2,
                            // Down Arrow Icon
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                            ),
                            underline: SizedBox(),
                            // Array list of items
                            items: items2.map((String items2) {
                              return DropdownMenuItem(
                                value: items2,
                                child: Text(items2),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue2 = newValue!;
                              });
                            },
                            style: TextStyle(
                                //te
                                color: Colors.white, //Font color
                                fontSize: 15 //font size on dropdown button
                                ),
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Color(0xFFFFB300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 210,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                shrinkWrap: true,
                itemCount: jobs.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailedViewDoWorkPage()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/gazon.jpg',
                                  height: 100, width: 200, fit: BoxFit.cover),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: 8, top: 10, left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                jobs[index].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 5, right: 5),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 13,
                                    color: Colors.lightBlue[700],
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    jobs[index].loc,
                                    style: TextStyle(
                                        color: Colors.lightBlue[700],
                                        fontWeight: FontWeight.w100,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 5, right: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(jobs[index].shortdescription,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jobs[index].price,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue[700]),
                                  ),
                                  Text(
                                    jobs[index].hours,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.lightBlue[700]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),

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
        currentIndex: 1,
        onTap: _onItemTapped,
      ),
    );
  }

  void setState(Null Function() param0) {}
}
