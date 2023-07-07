import 'dart:async';

import 'package:ars_news/model/colors.dart';
import 'package:ars_news/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var color = ColorsApp();

  bool _obscureText = true;

  bool loading = false;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKeyDaftar = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(color.bgColor),
      body: Form(
        key: formKeyDaftar,
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
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: kWidth / 20, top: kWidth / 60),
                        child: Text(
                          'Pendaftaran akun',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: kWidth / 20,
                          ),
                        ),
                      ),
                      Text(
                        "Nama Lengkap",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kWidth / 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: kWidth / 35),
                        child: TextFormField(
                          maxLength: 12,
                          controller: _namaController,
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
                            hintText: 'Masukkan nama lengkap anda',
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

                            if (formKeyDaftar.currentState!.validate()) {
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
                                  "Daftar",
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
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Kembali',
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
