import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugees_help/model/default.dart';
import 'package:refugees_help/screens/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passswordController = TextEditingController();
  var nameController = TextEditingController();
  var countryController = TextEditingController();
  var phoneController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCFD8DC),
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xffCFD8DC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    const Text(
                      'يسعدنا أن تنضم لنا',
                      style: TextStyle(
                        color: Color(0xff506169),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Image.asset(
                      'assets/images/friends.png',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      label: 'الاسم',
                      prefixIcon: Icons.person,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك قم بإدخال اسمك ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'البريد الإلكتروني',
                      prefixIcon: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك قم بإدخال البريد الاكتروني ';
                        }
                        if (!RegExp(r'^[\w\.]+@([\w]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                          return 'من فضلك ادخل البريد الاكتروني بطريقة صحيحة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: passswordController,
                      type: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      label: 'كلمة المرور',
                      suffix:
                          isPassword ? Icons.visibility_off : Icons.visibility,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'من فضبك ادخل كلمة المرور';
                        }
                        if (passswordController.text.length < 8) {
                          return 'كلمة المرور يجب ان تتكون من 8 أحرف او أرقام علي الأقل';
                        }
                        return null;
                      },
                      isPassword: isPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: countryController,
                      type: TextInputType.name,
                      label: 'الدولة',
                      prefixIcon: Icons.flag,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل اسم الدولة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IntlPhoneField(
                      controller: phoneController,
                      initialCountryCode: 'PS',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff2f9fc),
                        labelText: 'رقم الهاتف',
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(238, 238, 238, 1)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(238, 238, 238, 1)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(238, 238, 238, 1)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      invalidNumberMessage: 'من فضلك ادخل رقم هاتف صحيح',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff506169),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'تسجيل',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              register();
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      },
                      child: const Text(
                        'لديك حساب بالفعل؟',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register() {
    final usersBox = Hive.box('users');
    final email = emailController.text.trim();
    final name = nameController.text;
    final password = passswordController.text;
    final country = countryController.text;
    final phone = phoneController.text;

    if (usersBox.containsKey(email)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('حساب موجود'),
          content:
              const Text('هذا البريد موجود بالفعل استخدم بريد الكتروني أخر'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('موافق'),
            ),
          ],
        ),
      );
      emailController.clear();
      nameController.clear();
      passswordController.clear();
      countryController.clear();
      phoneController.clear();
      return;
    }

    usersBox.put(email, {
      'password': password,
      'name': name,
      'phone': phone,
      'country': country,
      'profilePhoto': 'assets/images/pfp.webp',
      'facebookLink': '',
      'istagramLink': '',
      'whatsAppLink': '',
      'about': '',
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('نجاح'),
        content: const Text('تم التسجيل بنجاح برجاء العودة لتسجيل الدخول'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
    emailController.clear();
    nameController.clear();
    passswordController.clear();
    countryController.clear();
    phoneController.clear();
  }
}
