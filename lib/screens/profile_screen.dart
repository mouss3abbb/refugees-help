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
  var selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "الملف الشخصي",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
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
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 2),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            // border: Border.all(
            //     color: const Color(0xff3c4a50).withOpacity(0.9), width: 3),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff3c4a50).withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: BlurEffect(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedPage = 0;
                      });
                    },
                    icon: Icon(
                      Icons.bookmarks_outlined,
                      size: 30,
                      color: Color(selectedPage == 0 ? 0xFFE8E5E1 : 0xffD4D7DEFF ),
                    )),
                GestureDetector(
                  onTap: (){
                    setState(() {

                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                  child: CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: user['profilePhoto'] == 'assets/images/pfp.webp' ? Image.asset(user['profilePhoto'],fit: BoxFit.cover,)
                          : Image.file(File(user['profilePhoto']),fit: BoxFit.cover,),
                    ),

                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.home_filled,
                      size: 30,
                      color: Color(selectedPage == 1 ?  0xFFE8E5E1:  0xffD4D7DEFF ),
                    )),
              ],
            ),
          ),
        )
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
            TextStyle(color: Colors.black54,fontSize: 16),
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
              style: TextStyle(color: Colors.black54, fontSize: 16),
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
              style: TextStyle(color: Colors.black54,fontSize: 16),
            ),
            onTap: () {
              email();
            },
          ),
        ],
      ),
    ],
  );

  // Widget buildUpgradeButton() => ButtonWidget(
  //   text: 'تعديل الملف الشخصي',
  //   onClicked: () {},
  // );

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
          style: TextStyle(fontSize: 16, height: 1.4,color: Colors.black),
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
