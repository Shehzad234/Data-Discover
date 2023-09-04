import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewContainer extends StatelessWidget {
  String name;
  IconData iconData;
  String image;
  final VoidCallback? callback;
  ListViewContainer(
      {super.key,
      required this.iconData,
      required this.name,
      required this.image,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(2, 140, 127, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.02,
            ),
            Image.asset(
              image,
              height: size.height * 0.09,
            ),
            SizedBox(
              width: size.width * 0.06,
            ),
            Text(
              name,
              style: textStyle,
            ),
            SizedBox(
              width: size.width * 0.08,
            ),
            Icon(
              iconData,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
