import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AboutListview extends StatelessWidget {
  final VoidCallback? callback;
  String title;
  String subtitle;
  IconData iconData;

  AboutListview(
      {super.key,
      required this.callback,
      required this.title,
      required this.subtitle,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(
            iconData,
            color: const Color.fromRGBO(2, 140, 127, 1),
          ),
        ),
      ),
    );
  }
}
