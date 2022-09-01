import 'package:flutter/material.dart';

import 'edit_profile_page.dart';
import 'numbers_widget.dart';
import 'profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: "assets/images/profile-pic.jpeg",
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage()),
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          const NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: const [
          Text(
            "Balota George",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 4),
          Text(
            "george.balota4@gmail.com",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
        ),
        onPressed: () {},
        child: const Text("Upgrade To Premium"),
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "About me",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
