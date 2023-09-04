import 'package:baidar_app/LikedScreens/likes.dart';
import 'package:baidar_app/models/textstyle.dart';
import 'package:baidar_app/screens/about_us.dart';
import 'package:baidar_app/screens/searchbymath.dart';
import 'package:baidar_app/screens/searchbymonth.dart';
import 'package:baidar_app/screens/searchgeneral.dart';
import 'package:baidar_app/screens/searchrandom.dart';
import 'package:baidar_app/screens/searhbyyear.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(2, 140, 127, 1),
            ),
            child: Lottie.asset("assets/drawer_lottie.json"),
          ),
          ListTile(
            title: Text("Search...",
                style: textStyle.copyWith(fontSize: 20, color: Colors.black)),
            subtitle: Text(
              "By just type  year , month ,general number and get useful informaion   ",
              style: textStyle.copyWith(fontSize: 15, color: Colors.black),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/calendar.png",
              height: size.height * 0.3,
              width: size.width * 0.09,
            ),
            title: Text(
              'year',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Searchbyyear();
              }));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/month.png",
              height: size.height * 0.3,
              width: size.width * 0.09,
            ),
            title: Text(
              'Month',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Searchbymonth();
              }));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/calculator.png",
              height: size.height * 0.3,
              width: size.width * 0.09,
            ),
            title: Text(
              'Math',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Searchbymath();
              }));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/hashtag.png",
              height: size.height * 0.3,
              width: size.width * 0.09,
            ),
            title: Text(
              'General Number',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Searchbygennumber();
              }));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/gamble.png",
              height: size.height * 0.3,
              width: size.width * 0.09,
            ),
            title: Text(
              'Random',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Searchbyrandom();
              }));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
              size: 30,
              color: Color.fromRGBO(2, 140, 127, 1),
            ),
            title: Text(
              'Liked',
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                // ignore: prefer_const_constructors
                return Tab_Bar();
              }));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              size: 30,
              color: Color.fromRGBO(2, 140, 127, 1),
            ),
            title: Text(
              "About us",
              style: textStyle.copyWith(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                // ignore: prefer_const_constructors
                return Aboutus();
              }));
            },
          ),
        ],
      ),
    );
  }
}
