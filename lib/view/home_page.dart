import 'package:ars_news/model/berita.dart';
import 'package:ars_news/model/colors.dart';
import 'package:ars_news/view/detail_berita.dart';
import 'package:ars_news/view/profile.dart';
import 'package:ars_news/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabBeritaController;

  @override
  void initState() {
    _tabBeritaController = TabController(length: 3, vsync: this);

    super.initState();
  }

  Widget BeritaTech(context) {
    var kWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < listBeritaTeknologi.length; i++) ...{
            Padding(
              padding: EdgeInsets.symmetric(vertical: kWidth / 25),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailBerita(
                      berita: listBeritaTeknologi[i],
                    );
                  }));
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.4, 1],
                        ),
                      ),
                      child: Image.asset(
                        listBeritaTeknologi[i].foto,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kWidth / 30, bottom: kWidth / 20),
                      child: Text(
                        listBeritaTeknologi[i].judul,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kWidth / 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          }
        ],
      ),
    );
  }

  Widget BeritaKuliner(context) {
    var kWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < listBeritaKuliner.length; i++) ...{
            Padding(
              padding: EdgeInsets.symmetric(vertical: kWidth / 25),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailBerita(
                      berita: listBeritaKuliner[i],
                    );
                  }));
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.4, 1],
                        ),
                      ),
                      child: Image.asset(
                        listBeritaKuliner[i].foto,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kWidth / 30, bottom: kWidth / 20),
                      child: Text(
                        listBeritaKuliner[i].judul,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kWidth / 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          }
        ],
      ),
    );
  }

  Widget BeritaCuaca(context) {
    var kWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < listBeritaCuaca.length; i++) ...{
            Padding(
              padding: EdgeInsets.symmetric(vertical: kWidth / 25),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailBerita(
                      berita: listBeritaCuaca[i],
                    );
                  }));
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.4, 1],
                        ),
                      ),
                      child: Image.asset(
                        listBeritaCuaca[i].foto,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kWidth / 30, bottom: kWidth / 20),
                      child: Text(
                        listBeritaCuaca[i].judul,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kWidth / 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          }
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(ColorsApp().bgColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: kWidth / 2,
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kWidth / 20, horizontal: kWidth / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: kWidth / 20,
                                  color: Colors.white),
                            ),
                            Text(
                              'Selamat datang di ARS News!',
                              style: TextStyle(
                                  fontSize: kWidth / 25, color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SearchPage();
                                  }));
                                },
                                icon: Icon(FontAwesomeIcons.search,
                                    size: kWidth / 20, color: Colors.white)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Profile();
                                  }));
                                },
                                icon: Icon(FontAwesomeIcons.circleUser,
                                    size: kWidth / 15, color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: kWidth / 10, bottom: kWidth / 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: .9,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(kWidth / 20))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kWidth / 20, horizontal: kWidth / 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: kWidth / 30),
                                child: Text(
                                  'Berita terkini',
                                  style: TextStyle(fontSize: kWidth / 20),
                                ),
                              ),
                              TabBar(
                                  enableFeedback: true,
                                  controller: _tabBeritaController,
                                  indicatorColor:
                                      Theme.of(context).primaryColor,
                                  indicatorWeight: kWidth / 99,
                                  unselectedLabelColor: Colors.grey,
                                  unselectedLabelStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: kWidth / 30,
                                  ),
                                  labelColor: Theme.of(context).primaryColor,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: kWidth / 25,
                                  ),
                                  tabs: [
                                    Tab(child: Text("Teknologi")),
                                    Tab(child: Text("Kuliner")),
                                    Tab(child: Text("Cuaca"))
                                  ]),
                              Container(
                                width: kWidth,
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                child: TabBarView(
                                  controller: _tabBeritaController,
                                  children: [
                                    Container(
                                      child: BeritaTech(context),
                                    ),
                                    Container(
                                      child: BeritaKuliner(context),
                                    ),
                                    Container(
                                      child: BeritaCuaca(context),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
