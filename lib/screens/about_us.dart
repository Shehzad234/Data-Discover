import 'package:baidar_app/models/textstyle.dart';
import 'package:baidar_app/widgets/about_us_listview.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 68.0),
          child: Text(
            "About",
            style: textStyle,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
      ),
      // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
      body: Column(
        children: [
          AboutListview(
            callback: () {},
            title: "App Version",
            subtitle: "Application current version",
            iconData: (Icons.one_x_mobiledata),
          ),
          AboutListview(
            callback: () async {
              final facebookUrl =
                  Uri.parse("https://www.facebook.com/betabytetech");
              if (await canLaunchUrl(facebookUrl)) {
                await launchUrl(facebookUrl,
                    mode: LaunchMode.externalApplication);
              }
            },
            title: "Facebook Page",
            subtitle: "Follow us on facebook",
            iconData: (Icons.facebook),
          ),
          AboutListview(
            callback: () async {
              final emial =
                  Uri(scheme: "mailto", path: "betabytetechnology@gmail.com");
              launchUrl(emial);
            },
            title: "Contact us",
            subtitle: "Contact us on Email ",
            iconData: (Icons.email_outlined),
          ),
        ],
      ),
    );
  }
}
