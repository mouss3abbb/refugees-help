import 'dart:io';
import 'dart:typed_data';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refugees_help/main.dart';
import 'package:refugees_help/model/user.dart';
import 'package:refugees_help/utils/user_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes.dart';
import 'main_screen.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

Map<String,String> newUser = {
  'name': '',
  'phone': '',
  'country': '',
  'profilePhoto': 'assets/images/pfp.webp',
  'facebookLink': '',
  'istagramLink': '',
  'whatsAppLink': '',
  'about': '',
};


List<String> fields = ['name','phone','facebookLink','istagramLink','whatsAppLink','about'];

class _EditProfilePageState extends State<EditProfilePage> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController nameController = TextEditingController(),phoneController=TextEditingController(),faceController=TextEditingController(),instaController=TextEditingController(),whatsController=TextEditingController(),aboutController=TextEditingController();
  @override
  void initState() {
    nameController.text = user['name'];
    phoneController.text = user['phone'];
    aboutController.text = user['about'];
    faceController.text = user['facebookLink'];
    whatsController.text = user['whatsAppLink'];
    instaController.text = user['istagramLink'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(user['about']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCFD8DC),
        elevation: 0,
        title: Text(
          "تعديل البيانات",
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
      body: Container(
        color: Color(0xffCFD8DC),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      newUser['profilePhoto'] = image!.path;
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: user['profilePhoto'] == 'assets/images/pfp.webp'
                            ? Image.asset(
                                user['profilePhoto'],
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(user['profilePhoto']),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 30,
                          )),
                    ]),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(controller: nameController, text: user['name'],labelText: 'الاسم',),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: phoneController,
                  text: user['phone'],
                  labelText: 'رقم الهاتف',
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: whatsController,
                  text: user['whatsAppLink'],
                  labelText: 'رقم الواتساب',
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: faceController,
                  text: user['facebookLink'],
                  labelText: 'رابط الفيسبوك',
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: instaController,
                  text: user['istagramLink'],
                  labelText: 'رابط الانستاجرام',
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: aboutController,
                  text: user['about'],
                  labelText: 'حول',
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                Container(
                    width: 100,
                    height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff506169),
                      shape: StadiumBorder(),

                    ),
                    onPressed: () {
                      setState(() {
                        user['name'] = nameController.text.toString();
                        user['phone'] = phoneController.text.toString();
                        user['whatsAppLink'] = whatsController.text.toString();
                        user['facebookLink'] = faceController.text.toString();
                        user['istagramLink'] = instaController.text.toString();
                        user['about'] = aboutController.text.toString();
                        if(image != null) {
                          user['profilePhoto'] = image!.path;
                        }
                        Hive.box('users').put(loggedUser, user);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              children: [
                                Text(
                                  'تم حفظ البيانات بنجاح'
                                )
                              ],
                            )
                        )
                        );
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('حفظ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField  extends StatelessWidget{
  final TextEditingController controller;
  final String text,labelText;
  final int maxLines;

  const CustomTextField({super.key, required this.controller, required this.text,this.maxLines = 1, required this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: const Color(0xffffffff),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(238, 238, 238, 1)),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xff506169)),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xff506169),),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

}

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
     /* ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          color: Colors.black,
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context)!;
            switcher.changeTheme(theme: theme);
          },
        ),
      ),*/
    ],
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          backgroundColor: Color(0xffCFD8DC)),
      child: Text(text),
      //onPressed: onClicked,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage()),
        );
      });
}

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          //scrollDirection: Axis.horizontal,
          //shrinkWrap: true,
          //direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 10,
          runSpacing: 5,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffef4881)),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    launchInstagram();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff0576d4)),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    urlLaunch();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    whatsapp();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
          ],
        )
      ]);

  whatsapp() async {
    await launch('https://wa.me/+201091021298?text=hello');
  }

  urlLaunch() async {
    const url = 'https://www.facebook.com/profile.php?id=100018326168342';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  launchInstagram() async {
    const nativeUrl = "instagram://user?username=severinas_app";
    const webUrl = "https://www.instagram.com/severinas_app/";
    if (await canLaunch(nativeUrl)) {
      await launch(nativeUrl);
    } else if (await canLaunch(webUrl)) {
      await launch(webUrl);
    } else {
      print("can't open Instagram");
    }
  }
}

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, '4.8', 'Ranking'),
      buildDivider(),
      buildButton(context, '35', 'Following'),
      buildDivider(),
      buildButton(context, '50', 'Followers'),
    ],
  );
  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}


class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: () {}),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => InkResponse(
    child: buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo : Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
    onTap: onClicked,
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: Color(0xff817c77),
          child: child,
        ),
      );
}

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLines: widget.maxLines,
      ),
    ],
  );
}
