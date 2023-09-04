import 'dart:convert';

import 'package:baidar_app/models/helper.dart';
import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class Searchbymonth extends StatefulWidget {
  const Searchbymonth({super.key});

  @override
  State<Searchbymonth> createState() => _SearchbymonthState();
}

class _SearchbymonthState extends State<Searchbymonth> {
  Color favoritecolor = Colors.white;

  List monthList = [];

  int monthdata = -1;
  int datedata = -1;

  Map? mapresponse;
  TextEditingController controller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();

  bool isLoading = false;
  String errorMessage = '';
  final _key = GlobalKey<FormState>();
  String months = "";

  String days = "";

  searcher({required String searchNumber, required String day}) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    String url = "http://numbersapi.com/$searchNumber/$day?json";
    var response = await http.get(Uri.parse(url));
    if (await Helper.isNotConnected()) {
      setState(() {
        isLoading = false;
        errorMessage = 'No intenet connection';
      });
      return;
    } else if (searchNumber.isEmpty) {
      setState(() {
        isLoading = false;
        errorMessage = 'Please provide a number';
      });
      return;
    } else if (searchNumber.contains("#")) {
      setState(() {
        isLoading = false;
        errorMessage = 'Please provivde numbers only';
      });
      return;
    } else if (monthdata < 1 ||
        datedata < 1 ||
        monthdata > 12 ||
        datedata > 31) {
      setState(() {
        isLoading = false;
        errorMessage = 'Please provide correct date';
      });
      return;
    } else if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        var jsonbodydata = json.decode(response.body);
        mapresponse = jsonbodydata;
      });
    } else {
      setState(() {
        isLoading = false;
        errorMessage = 'Please enter only numbers';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "search for month",
          style: textStyle,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, right: 28, top: 28, bottom: 9),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (String value) {
                      months = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter number";
                      }
                      if (int.parse(value) > 12) {
                        return "month should not be greater then 12";
                      }
                      if (int.parse(value) < 1) {
                        return "month should be greater then 0";
                      } else {
                        return null;
                      }

                      // if (int.parse(value) < 1) {
                      //   return "number should be greater then 0";
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(2, 140, 127, 1), width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(2, 140, 127, 1),
                          ),
                        ),
                        prefixIconColor: const Color.fromRGBO(2, 140, 127, 1),
                        prefixStyle: const TextStyle(
                          color: Color.fromRGBO(2, 140, 127, 1),
                        ),
                        hintStyle: textStyle.copyWith(
                          fontSize: 15,
                          color: const Color.fromRGBO(2, 140, 127, 1),
                        ),
                        labelStyle: textStyle.copyWith(
                          fontSize: 15,
                          color: const Color.fromRGBO(2, 140, 127, 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: ("Enter month"),
                        labelText: "Enter month..."),
                    controller: monthcontroller,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      months = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter number";
                      }
                      if (int.parse(value) > 31) {
                        return "date should not be greater then 31";
                      }
                      if (int.parse(value) < 1) {
                        return "date should be greater then 0";
                      } else {
                        return null;
                      }

                      // if (int.parse(value) < 1) {
                      //   return "number should be greater then 0";
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(2, 140, 127, 1), width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(2, 140, 127, 1),
                          ),
                        ),
                        prefixIconColor: const Color.fromRGBO(2, 140, 127, 1),
                        prefixStyle: const TextStyle(
                          color: Color.fromRGBO(2, 140, 127, 1),
                        ),
                        hintStyle: textStyle.copyWith(
                            color: const Color.fromRGBO(2, 140, 127, 1),
                            fontSize: 15),
                        labelStyle: textStyle.copyWith(
                          fontSize: 15,
                          color: const Color.fromRGBO(2, 140, 127, 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: ("Enter date"),
                        labelText: "Enter date..."),
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
                foregroundColor: Colors.white),
            onPressed: () async {
              setState(() {
                favoritecolor = Colors.white;
              });
              if (_key.currentState!.validate()) {
                setState(() {});
              }
              if (await Helper.isNotConnected()) {
                setState(() {
                  isLoading = false;
                  errorMessage = 'No intenet connection';
                });
              } else {
                final searchnumber = monthcontroller.text.trim();
                final searchday = controller.text.trim();
                monthdata = int.parse(searchnumber);
                datedata = int.parse(searchday);

                searcher(searchNumber: searchnumber, day: searchday);
              }
            },
            child: Text(
              "search",
              style: textStyle.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.09,
          ),
          if (isLoading)
            const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(2, 140, 127, 1),
            ))
          else if (errorMessage.isNotEmpty)
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: size.height * 0.25,
                width: size.width * 0.83,
                child: Center(
                    child: Text(
                  errorMessage,
                  style: textStyle.copyWith(color: Colors.black, fontSize: 18),
                )))
          // else if( Helper.isNotConnected())
          //    Text(errorMessage)
          else if (controller.text.isEmpty)
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: size.height * 0.25,
                width: size.width * 0.83,
                child: Center(
                    child: Text(
                  "Enter month",
                  style: textStyle.copyWith(color: Colors.black, fontSize: 22),
                )))
          else
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: 250,
                  width: 320,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      mapresponse?["text"].toString() ?? '',
                      style:
                          textStyle.copyWith(color: Colors.black, fontSize: 18),
                    ),
                  )),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(144, 144, 144, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: 320,
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              favoritecolor = Colors.yellow;
                            });

                            var box = Hive.box("month_box");
                            monthList = box.get("month") ?? [];
                            monthList.add(mapresponse!["text"]);
                            monthList = monthList.toSet().toList();
                            box.put("month", monthList);
                            monthList = box.get("month") ?? [];

                            //snack bar

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 1),
                                backgroundColor:
                                    const Color.fromRGBO(2, 140, 127, 1),
                                content: Text(
                                  "Added to Favorites",
                                  style: textStyle.copyWith(fontSize: 15),
                                )));
                          },
                          child: Icon(
                            Icons.star,
                            color: favoritecolor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            var txt = mapresponse!["text"].toString();
                            Share.share(txt);
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
        ],
      )),
    );
  }
}
