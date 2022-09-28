import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/do-work/models/work-detailed.model.dart';
import 'package:omda_frontend/src/features/do-work/services/do-work.service.dart';
import 'package:omda_frontend/src/features/my-works/widgets/my-works-page.dart';
import 'package:omda_frontend/src/shared/helper.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';
import 'package:omda_frontend/src/shared/user-data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedViewDoWorkPage extends StatefulWidget {
  DetailedViewDoWorkPage({Key? key, required this.workId}) : super(key: key);
  final String workId;

  @override
  State<DetailedViewDoWorkPage> createState() => _DetailedViewDoWorkPageState();
}

class _DetailedViewDoWorkPageState extends State<DetailedViewDoWorkPage> {
  late WorkDetailedModel? work = null;

  void getWorkDetails() async {
    work = await DoWorkService().getWorkDetails(widget.workId);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void acceptWork(BuildContext context, String workId) async {
    if (await DoWorkService().acceptWork(workId)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MyWorksPage()),
      );

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
            textAlign: TextAlign.center,
            "Anunţ acceptat",
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
            textAlign: TextAlign.center,
            "O problemă a fost întâmpinată, te rog să reâncerci",
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getWorkDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: work == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  color: ThemeColors.secondary,
                ),
              ),
            )
          : ListView(
              children: [
                SizedBox(
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
                              image:
                                  AssetImage(getCategoryImage(work!.category)),
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 320,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 30,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 580,
                          decoration: const BoxDecoration(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    work!.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: ThemeColors.secondary,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        work!.location,
                                        style: TextStyle(
                                          color: ThemeColors.secondary,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Wrap(
                                          children: List.generate(5, (index) {
                                            return Icon(
                                              Icons.star,
                                              color: ThemeColors.primary,
                                            );
                                          }),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                            color: ThemeColors.secondary,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${work!.price} RON",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ThemeColors.secondary,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ThemeColors.primary,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Text(work!.category),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ThemeColors.primary,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Text(work!.duration),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ThemeColors.primary,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Text(work!.date),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(color: Colors.black),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Descriere:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                work!.description,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        work!.acceptedByUserId == null ||
                                                UserData.id ==
                                                    work!.acceptedByUserId
                                            ? "Postat de către:"
                                            : "Acceptat de către:",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        work!.acceptedByUserId == null ||
                                                UserData.id ==
                                                    work!.acceptedByUserId
                                            ? work!.userFullName
                                            : work!.acceptedByUserFullName!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        work!.acceptedByUserId == null ||
                                                UserData.id ==
                                                    work!.acceptedByUserId
                                            ? work!.userEmail
                                            : work!.acceptedByUserEmail!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      UserData.id == work!.userId ||
                                              UserData.id ==
                                                  work!.acceptedByUserId
                                          ? TextButton(
                                              onPressed: () {
                                                launchUrl(Uri.parse(
                                                    "tel://${work!.acceptedByUserId == null || UserData.id == work!.acceptedByUserId ? work!.userPhone : work!.acceptedByUserPhone}"));
                                              },
                                              child: Text(
                                                work!.acceptedByUserId ==
                                                            null ||
                                                        UserData.id ==
                                                            work!
                                                                .acceptedByUserId
                                                    ? work!.userPhone
                                                    : work!
                                                        .acceptedByUserPhone!,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              UserData.id.isEmpty ||
                                      UserData.id == work!.userId ||
                                      work!.acceptedByUserId != null
                                  ? const SizedBox()
                                  : InkWell(
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: ThemeColors.primary,
                                            ),
                                            child: const Center(
                                              child: Text('Acceptă'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () =>
                                          {acceptWork(context, work!.id)},
                                    ),
                              const SizedBox(height: 30),
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
