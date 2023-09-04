// ignore_for_file: camel_case_types

import 'package:baidar_app/LikedScreens/general_like.dart';
import 'package:baidar_app/LikedScreens/math_like.dart';
import 'package:baidar_app/LikedScreens/month_like.dart';
import 'package:baidar_app/LikedScreens/random_like.dart';
import 'package:baidar_app/models/textstyle.dart';
import 'package:baidar_app/LikedScreens/year_like.dart';
import 'package:flutter/material.dart';

class Tab_Bar extends StatefulWidget {
  const Tab_Bar({super.key});

  @override
  State<Tab_Bar> createState() => _Tab_BarState();
}

class _Tab_BarState extends State<Tab_Bar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          foregroundColor: const Color.fromRGBO(2, 140, 127, 1),
          backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
          bottom: TabBar(
            labelStyle: textStyle.copyWith(color: Colors.white, fontSize: 10),
            labelColor: Colors.white,
            indicatorColor: Colors.black54,
            padding: const EdgeInsets.only(top: 6),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: 25,
                ),
                text: "Year ",
              ),
              const Tab(
                icon: Icon(
                  Icons.calendar_today,
                  size: 25,
                  color: Colors.white,
                ),
                text: "Month",
              ),
              const Tab(
                icon: Icon(
                  Icons.calculate,
                  size: 25,
                  color: Colors.white,
                ),
                text: "Math",
              ),
              const Tab(
                icon: Icon(
                  Icons.numbers,
                  size: 25,
                  color: Colors.white,
                ),
                text: "General",
              ),
              const Tab(
                icon: Icon(
                  Icons.info,
                  size: 25,
                  color: Colors.white,
                ),
                text: "Random",
              ),
            ],
          ),
          title: Text(
            'Liked Information',
            style: textStyle,
          ),
        ),
        body: const TabBarView(children: [
          YearsLike(),
          MonthLike(),
          MathLike(),
          GeneralLike(),
          RandomLike(),
        ]),
      ),
    );
  }
}
