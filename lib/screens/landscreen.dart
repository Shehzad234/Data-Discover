import "package:baidar_app/models/drawer.dart";
import "package:baidar_app/models/textstyle.dart";
import "package:baidar_app/screens/searchbymath.dart";
import "package:baidar_app/screens/searchbymonth.dart";
import "package:baidar_app/screens/searchgeneral.dart";
import "package:baidar_app/screens/searchrandom.dart";
import "package:baidar_app/screens/searhbyyear.dart";
import "package:baidar_app/widgets/listviewcontainer.dart";
import "package:flutter/material.dart";

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        appBar: AppBar(
          title: Text(
            "Discover Data",
            style: textStyle.copyWith(fontSize: 25),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 3,
                      crossAxisCount: 1),
                  children: [
                    ListViewContainer(
                      iconData: Icons.keyboard_arrow_right,
                      name: "Year",
                      image: "assets/calendar.png",
                      callback: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Searchbyyear();
                        }));
                      },
                    ),
                    ListViewContainer(
                      iconData: Icons.keyboard_arrow_right,
                      name: "Month",
                      image: "assets/month.png",
                      callback: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Searchbymonth();
                        }));
                      },
                    ),
                    ListViewContainer(
                      iconData: Icons.keyboard_arrow_right,
                      name: "Math",
                      image: "assets/calculator.png",
                      callback: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Searchbymath();
                        }));
                      },
                    ),
                    ListViewContainer(
                      iconData: Icons.keyboard_arrow_right,
                      name: "General",
                      image: "assets/hashtag.png",
                      callback: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Searchbygennumber();
                        }));
                      },
                    ),
                    ListViewContainer(
                      iconData: Icons.keyboard_arrow_right,
                      name: "Random",
                      image: "assets/gamble.png",
                      callback: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Searchbyrandom();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
