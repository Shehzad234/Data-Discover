import 'dart:convert';

import 'package:baidar_app/models/helper.dart';
import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class Searchbyyear extends StatefulWidget {
  const Searchbyyear({super.key});

  @override
  State<Searchbyyear> createState() => _SearchbyyearState();
}

class _SearchbyyearState extends State<Searchbyyear> {
  Color favoritecolor = Colors.white;

  List gettedList = [];
  Map? mapresponse;
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';
  final _key = GlobalKey<FormState>();
  String year = "";
  searcher({required String searchNumber}) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    String url = "http://numbersapi.com/$searchNumber/year?json";
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
        actionsIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 196, 19, 19)),
        title: Text(
          "search for year",
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
              child: TextFormField(
                onChanged: (String value) {
                  year = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter number";
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
                        color: const Color.fromRGBO(2, 140, 127, 1),
                        fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: ("Enter year"),
                    labelText: "Enter year..."),
                controller: controller,
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
                final searchnumber = controller.text.trim();
                searcher(searchNumber: searchnumber);
              }
            },
            child: Text(
              "search",
              style: textStyle.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.13,
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
                height: 200,
                width: 300,
                child: Center(
                    child: Text(
                  errorMessage,
                  style: textStyle.copyWith(fontSize: 15, color: Colors.black),
                )))
          // else if( Helper.isNotConnected())
          //    Text(errorMessage)
          else if (controller.text.isEmpty)
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: 300,
                child: Center(
                    child: Text(
                  "Enter year",
                  style: textStyle.copyWith(fontSize: 15, color: Colors.black),
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
                          textStyle.copyWith(fontSize: 15, color: Colors.black),
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
                          onTap: () async {
                            setState(() {
                              favoritecolor = Colors.yellow;
                            });
                            // var box = await Hive.openBox("info_box");
                            // box.put("info", mapresponse!["text"]);

                            var box = Hive.box("info_box");
                            gettedList = box.get("info") ?? [];
                            gettedList.add(mapresponse!["text"]);
                            gettedList = gettedList.toSet().toList();
                            box.put("info", gettedList);
                            gettedList = box.get("info") ?? [];

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
                          // ignore: prefer_const_constructors
                          child: Icon(
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
