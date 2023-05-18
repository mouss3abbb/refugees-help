import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refugees_help/model/user.dart';
import 'package:refugees_help/screens/edit_profile_screen.dart';
import 'package:refugees_help/utils/user_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath!,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 25),
            // Center(child: buildUpgradeButton()),
            // const SizedBox(height: 24),
            ContactWidget(),
            const SizedBox(height: 20),
            buildAbout(user),
          ],
        ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.country!,
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Text(
              user.phone!,
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              calling();
            },
          ),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Text(
              user.email!,
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              email();
            },
          ),
        ],
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'تعديل الملف الشخصي',
    onClicked: () {},
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'حول',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about!,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
  calling() async {
    const url = 'tel:+201025027368';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lanch $url';
    }
  }

  email() {
    launch(
        'mailto:sarasamir0105@gmail.com?subject=TestEmail&body=I am typing this test email%20plugin');
  }
}
