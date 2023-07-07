import 'package:ars_news/model/berita.dart';
import 'package:flutter/material.dart';

class DetailBerita extends StatelessWidget {
  const DetailBerita({required this.berita});
  final Berita berita;
  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kWidth / 20, vertical: kWidth / 10),
          child: Column(
            children: [
              Text(
                berita.judul,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: kWidth / 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kWidth / 20),
                child: Image.asset(
                  berita.foto,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                berita.isi,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: kWidth / 25),
              )
            ],
          ),
        ),
      )),
    );
  }
}
