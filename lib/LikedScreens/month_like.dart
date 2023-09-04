import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class MonthLike extends StatefulWidget {
  const MonthLike({super.key});

  @override
  State<MonthLike> createState() => _MonthLikeState();
}

class _MonthLikeState extends State<MonthLike> {
  List monthList = [];
  monthFunction() async {
    var box = Hive.box("month_box");
    monthList = box.get("month");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    monthFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: monthList.length,
              itemBuilder: (context, index) {
                return monthList.isEmpty
                    ? const Center(child: Text("Empty"))
                    : Column(
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
                                monthList[index].toString(),
                                style: textStyle.copyWith(
                                    fontSize: 15, color: Colors.black),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      // var box = await Hive.openBox("info_box");
                                      // box.put("info", mapresponse!["text"]);

                                      var box = Hive.box("month_box");
                                      List tempList = box.get("month") ?? [];
                                      tempList
                                          .remove(monthList[index].toString());
                                      box.put("month", tempList);
                                      monthList = box.get("month") ?? [];
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var txt = monthList[index].toString();
                                      Share.share(txt);
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                // : Center(child: Text(gettedList[index]));
              }),
        ),
      ],
    ));
  }
}
