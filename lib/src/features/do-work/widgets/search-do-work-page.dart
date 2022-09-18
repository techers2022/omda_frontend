import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/do-work/widgets/detailed-view-do-work-page.dart';
import 'package:omda_frontend/src/features/get-work/widgets/search-get-work-page.dart';
import 'package:omda_frontend/src/features/do-work/widgets/do_work_job.dart';
import 'package:omda_frontend/src/features/do-work/widgets/jobs_data.dart';
import 'package:omda_frontend/src/shared/layout.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';

class SearchDoWorkPage extends StatelessWidget {
  SearchDoWorkPage({Key? key}) : super(key: key);
  List<DoWorkJobs> jobs = JobsData.getMockedJobs();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      appBar: Layout.appBar(context),
      drawer: Layout.drawer(context),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 0),
                    width: 150,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ThemeColors.primary,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue,
                            isExpanded: true,

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
                            style: const TextStyle(
                                color: Colors.white, //Font color
                                fontSize: 15 //font size on dropdown button
                                ),
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: ThemeColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 0),
                    width: 150,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ThemeColors.primary,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue2,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                            ),
                            underline: const SizedBox(),
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
                            style: const TextStyle(
                              color: Colors.white, //Font color
                              fontSize: 15, //font size on dropdown button
                            ),
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: ThemeColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 275,
                ),
                shrinkWrap: true,
                itemCount: jobs.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 400,
                      minWidth: 300,
                      maxHeight: 400,
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailedViewDoWorkPage(nr: index),
                          ),
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 10, left: 10, right: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              jobs[index].name,
                              style: TextStyle(
                                fontSize: 15,
                                color: ThemeColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 5,
                              right: 5,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 13,
                                  color: Colors.lightBlue[700],
                                ),
                                const SizedBox(
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
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 5,
                              right: 5,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              jobs[index].shortdescription,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  jobs[index].price,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColors.secondary,
                                  ),
                                ),
                                Text(
                                  jobs[index].hours,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ThemeColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Layout.bottomNavigationBar(context, 1),
    );
  }

  void setState(Null Function() param0) {}
}
