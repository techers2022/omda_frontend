import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:omda_frontend/src/features/do-work/models/work-simple.model.dart';
import 'package:omda_frontend/src/features/do-work/widgets/detailed-view-do-work-page.dart';
import 'package:omda_frontend/src/features/my-works/services/my-works.service.dart';
import 'package:omda_frontend/src/shared/helper.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';

class MyWorksPage extends StatefulWidget {
  const MyWorksPage({Key? key}) : super(key: key);

  @override
  State<MyWorksPage> createState() => _MyWorksPageState();
}

class _MyWorksPageState extends State<MyWorksPage> {
  late List<WorkSimpleModel>? acceptedWorks = null;
  late List<WorkSimpleModel>? postedWorks = null;

  void getAcceptedWorks() async {
    acceptedWorks = await MyWorksService().getAllWorksAcceptedByUser();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void getPostedWorks() async {
    postedWorks = await MyWorksService().getAllWorksFromUser();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    getAcceptedWorks();
    getPostedWorks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Anunţurile mele"),
          backgroundColor: ThemeColors.primary,
          bottom: TabBar(
            indicatorColor: ThemeColors.secondary,
            tabs: const [
              Tab(text: "Acceptate"),
              Tab(text: "Postate"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            acceptedWorks == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(
                        color: ThemeColors.secondary,
                      ),
                    ),
                  )
                : acceptedWorks!.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Nu există niciun anunţ acceptat"),
                      ))
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: 0.68,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          mainAxisExtent: 275,
                        ),
                        shrinkWrap: true,
                        itemCount: acceptedWorks!.length,
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
                              vertical: 8,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailedViewDoWorkPage(
                                        workId: acceptedWorks![index].id),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      getCategoryImage(acceptedWorks![index].category),
                                      height: 100,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 8,
                                        top: 10,
                                        left: 10,
                                        right: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      acceptedWorks![index].title,
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
                                          color: ThemeColors.secondary,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          acceptedWorks![index].location,
                                          style: TextStyle(
                                            color: ThemeColors.secondary,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10,
                                          ),
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
                                      acceptedWorks![index].shortDescription,
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
                                          "${acceptedWorks![index].price} RON",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.secondary,
                                          ),
                                        ),
                                        Text(
                                          acceptedWorks![index].duration,
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
            postedWorks == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(
                        color: ThemeColors.secondary,
                      ),
                    ),
                  )
                : postedWorks!.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Nu există niciun anunţ postat"),
                      ))
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: 0.68,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          mainAxisExtent: 275,
                        ),
                        shrinkWrap: true,
                        itemCount: postedWorks!.length,
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
                              vertical: 8,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailedViewDoWorkPage(
                                        workId: postedWorks![index].id),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      getCategoryImage(postedWorks![index].category),
                                      height: 100,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 8,
                                        top: 10,
                                        left: 10,
                                        right: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      postedWorks![index].title,
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
                                          color: ThemeColors.secondary,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          postedWorks![index].location,
                                          style: TextStyle(
                                            color: ThemeColors.secondary,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10,
                                          ),
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
                                      postedWorks![index].shortDescription,
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
                                          "${postedWorks![index].price} RON",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.secondary,
                                          ),
                                        ),
                                        Text(
                                          postedWorks![index].duration,
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
      ),
    );
  }
}
