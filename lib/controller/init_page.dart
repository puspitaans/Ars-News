import 'dart:async';

import 'package:ars_news/view/home_page.dart';
import 'package:ars_news/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  var username;

  Future checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") == null) {
      username = null;
    } else if (prefs.getString("username") != null) {
      username = prefs.getString("username");
    }
  }

  String checkData() {
    if (username == null) {
      return 'false';
    } else if (username != null) {
      return 'true';
    }
    return 'false';
  }

  Future _direction() async {
    if (checkData() == 'true') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => (const HomePage())));
    } else if (checkData() == 'false') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => (LoginPage())));
    }
  }

  @override
  void initState() {
    checkPrefs();
    super.initState();
    Timer(const Duration(milliseconds: 1300), () {
      _direction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
