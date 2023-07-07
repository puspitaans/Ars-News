import 'package:ars_news/view/home_page.dart';
import 'package:ars_news/view/login_page.dart';
import 'package:flutter/material.dart';

import 'controller/init_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARS News',
      initialRoute: '/init',
      routes: {
        '/init': (BuildContext context) => const InitPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => const HomePage()
      },
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
