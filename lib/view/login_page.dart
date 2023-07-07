import 'dart:async';

import 'package:ars_news/model/colors.dart';
import 'package:ars_news/view/home_page.dart';
import 'package:ars_news/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var color = ColorsApp();

  bool _obscureText = true;

  bool loading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showToast() {
    var kWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kWidth / 20),
              topRight: Radius.circular(kWidth / 20)),
        ),
        isDismissible: false,
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(kWidth / 20),
              child: Column(
                children: [
                  Text(
                    'Username atau password tidak sesuai, harap periksa kembali.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: kWidth / 22, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: kWidth / 20),
                    child: Container(
                      width: kWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kWidth / 40),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: kWidth / 30),
                          child: Text(
                            "Kembali",
                            style: TextStyle(
                                fontSize: kWidth / 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(color.bgColor),
      body: Form(
        key: formKeyLogin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kWidth / 20),
              child: Container(
                width: kWidth,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: kWidth / 20, horizontal: kWidth / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kWidth / 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: kWidth / 20, top: kWidth / 60),
                        child: Text(
                          'Silahkan masuk terlebih dahulu',
                          style: TextStyle(
                            fontSize: kWidth / 25,
                          ),
                        ),
                      ),
                      Text(
                        "Username",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kWidth / 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: kWidth / 35),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              (RegExp("[a-zA-Z0-9]")),
                            )
                          ],
                          maxLength: 12,
                          controller: _usernameController,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            counterText: '',
                            prefixIcon: Container(
                              margin: EdgeInsets.only(right: kWidth / 25),
                              height: kWidth / 10,
                              width: kWidth / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kWidth / 50),
                                    bottomLeft: Radius.circular(kWidth / 50)),
                                color: Color.fromARGB(255, 240, 239, 239),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidUser,
                                fill: 1,
                                size: kWidth / 28,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: kWidth / 20),
                            hintStyle: TextStyle(fontSize: kWidth / 28),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Masukkan username anda',
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harus diisi';
                            }

                            return null;
                          },
                        ),
                      ),
                      Text(
                        "Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kWidth / 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: kWidth / 35, bottom: kWidth / 15),
                        child: TextFormField(
                          maxLength: 32,
                          controller: _passwordController,
                          autofocus: false,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            counterText: '',
                            prefixIcon: Container(
                              margin: EdgeInsets.only(right: kWidth / 25),
                              height: kWidth / 10,
                              width: kWidth / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kWidth / 50),
                                    bottomLeft: Radius.circular(kWidth / 50)),
                                color: Color.fromARGB(255, 240, 239, 239),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(
                                FontAwesomeIcons.key,
                                fill: 1,
                                size: kWidth / 28,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: kWidth / 20),
                            hintStyle: TextStyle(fontSize: kWidth / 28),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Masukkan password anda',
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kWidth / 50)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                _toggle();
                              },
                              child: Icon(
                                _obscureText
                                    ? FontAwesomeIcons.solidEyeSlash
                                    : FontAwesomeIcons.solidEye,
                                size: kWidth / 28,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harus diisi';
                            }

                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: kWidth,
                        height: kWidth / 11,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            if (formKeyLogin.currentState!.validate()) {
                              loading = true;
                              FocusManager.instance.primaryFocus?.unfocus();

                              setState(() {
                                loading = false;
                                prefs.setString(
                                    "username", _usernameController.text);
                              });

                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }));
                            }
                          },
                          child: loading
                              ? SizedBox(
                                  height: kWidth / 25,
                                  width: kWidth / 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "Masuk",
                                  style: TextStyle(
                                      fontSize: kWidth / 25,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                      Container(
                          width: kWidth,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterPage();
                                }));
                              },
                              child: Text(
                                'Daftar Akun',
                                style: TextStyle(
                                    fontSize: kWidth / 25,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
