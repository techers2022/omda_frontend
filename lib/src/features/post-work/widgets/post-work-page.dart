import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/main/widgets/category.dart';
import 'package:omda_frontend/src/features/main/widgets/data.dart';
import 'package:omda_frontend/src/features/post-work/services/post-work.service.dart';
import 'package:omda_frontend/src/shared/layout.dart';
import 'package:omda_frontend/src/shared/theme-colors.dart';

class PostWorkPage extends StatefulWidget {
  const PostWorkPage({Key? key}) : super(key: key);

  @override
  State<PostWorkPage> createState() => _PostWorkPageState();
}

class _PostWorkPageState extends State<PostWorkPage> {
  List<Category> categories = Data.getMockedCategories();

  String selectedCategory = Data.getMockedCategories().first.name;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void postWork(BuildContext context) async {
    if (await PostWorkService().postWork(
        selectedCategory,
        descriptionController.text,
        dateController.text,
        durationController.text,
        priceController.text)) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
            textAlign: TextAlign.center,
            "Anunț adăugat cu succes",
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: Layout.appBar(context, true),
          drawer: Layout.drawer(context),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Ai nevoie de ajutor?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Postează acum anunțul tău!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Categorie',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedCategory,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCategory = value!;
                              });
                            },
                            items: categories.map<DropdownMenuItem<String>>(
                                (Category value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(value.name),
                              );
                            }).toList(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Descriere',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            controller: descriptionController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  'Caut persoană pentru tuns 100mp2 gazon.',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Data',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 59, 122),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '14/09/2022',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Durata',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 59, 122),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            controller: durationController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '3 ore',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Preț',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Stack(
                            children: <Widget>[
                              TextField(
                                controller: priceController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '100',
                                ),
                              ),
                              const Positioned.fill(
                                right: 8,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("RON"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              postWork(context);
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeColors.primary,
                              ),
                              child: const Center(
                                child: Text(
                                  "Postează",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.directions_transit),
            ],
          ),
          bottomNavigationBar: Layout.bottomNavigationBar(context, 3)),
    );
  }
}
