import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:refugees_help/model/user.dart';
import 'package:refugees_help/screens/edit_profile_screen.dart';
import 'package:refugees_help/utils/user_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'main_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,
                  child: Stack(
                    children: [
                      ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: user['profilePhoto'] == 'assets/images/pfp.webp' ? Image.asset(user['profilePhoto'],fit: BoxFit.cover,)
                            : Image.file(File(user['profilePhoto']),fit: BoxFit.cover,),
                    ),
                      Align(
                        alignment: Alignment.bottomRight,
                          child: Icon(Icons.add_a_photo,size: 30,)
                      ),
                    ]
                  ),
                ),
              ),
              // ProfileWidget(
              //   imagePath: user['profilePhoto'],
              //   onClicked: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => EditProfilePage()),
              //     );
              //   },
              // ),
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
        ),
    );
  }

  Widget buildName(user) => Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user['name'],
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
            user['country'],
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
              user['phone'],
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
              loggedUser,
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

  Widget buildAbout(user) => Container(
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
          user['about'],
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
  calling() async {
    var url = user['phone'];
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
