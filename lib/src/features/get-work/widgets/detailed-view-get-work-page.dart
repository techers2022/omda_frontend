import 'package:flutter/material.dart';

class DetailedViewGetWorkPage extends StatelessWidget {
  const DetailedViewGetWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed View Work Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/gigel.jpg',
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Tuns gazon",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      '100 RON',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                      'Am nevoie urgenta de cazonul tuns, platesc bine si ofer scule'),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
