import 'package:ars_news/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future _logout(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  void confirmLogOut() {
    var kWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kWidth / 20),
              topRight: Radius.circular(kWidth / 20)),
        ),
        builder: (context) {
          return IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(kWidth / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Apakah anda yakin ingin logout?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kWidth / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: kWidth / 3,
                        padding: EdgeInsets.only(
                            top: kWidth / 20, bottom: kWidth / 20),
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
                            padding:
                                EdgeInsets.symmetric(vertical: kWidth / 30),
                            child: Text(
                              "BATAL",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: kWidth / 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: kWidth / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(kWidth / 40),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            _logout(context);
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: kWidth / 30),
                            child: Text(
                              "LOGOUT",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: kWidth / 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: kWidth / 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kWidth / 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.circleUser,
                        size: kWidth / 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: kWidth / 30),
                        child: Text(
                          'User',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kWidth / 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.withOpacity(.25),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: kWidth / 25, bottom: kWidth / 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: kWidth / 20, right: kWidth / 20),
                                  child: Text(
                                    "Kritik & Saran",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kWidth / 23),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: kWidth / 15,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kWidth / 9),
                          child: Text(
                            "Bantu kami untuk selalu menghadirkan kualitas konten yang baik melalui kritik Anda.",
                            style: TextStyle(fontSize: kWidth / 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.withOpacity(.25),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: kWidth / 25, bottom: kWidth / 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: kWidth / 20),
                                  child: Text(
                                    "Beri Penilaian",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kWidth / 23),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: kWidth / 15,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kWidth / 9),
                          child: Text(
                            "Bantu kami untuk selalu menghadirkan pengalaman membaca yang baik dengan memberikan rating & review di Google Play Store.",
                            style: TextStyle(fontSize: kWidth / 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.withOpacity(.25),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: kWidth / 25, bottom: kWidth / 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.info,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: kWidth / 20),
                                  child: Text(
                                    "Tentang ARS News",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kWidth / 23),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: kWidth / 15,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kWidth / 9),
                          child: Text(
                            "Informasi mengenai versi aplikasi dan hak cipta konten.",
                            style: TextStyle(fontSize: kWidth / 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.withOpacity(.25),
                ),
                InkWell(
                  onTap: () {
                    confirmLogOut();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: kWidth / 25, bottom: kWidth / 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Theme.of(context).primaryColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: kWidth / 20),
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: kWidth / 23),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).primaryColor,
                          size: kWidth / 15,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.withOpacity(.25),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
