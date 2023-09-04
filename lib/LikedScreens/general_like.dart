import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class GeneralLike extends StatefulWidget {
  const GeneralLike({super.key});

  @override
  State<GeneralLike> createState() => _GeneralLikeState();
}

class _GeneralLikeState extends State<GeneralLike> {
  List generalList = [];
  mathFunction() async {
    var box = Hive.box("general_box");
    generalList = box.get("general");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    mathFunction();
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
              itemCount: generalList.length,
              itemBuilder: (context, index) {
                return generalList.isEmpty
                    ? Center(
                        child: Text(
                        "Empty",
                        style: textStyle.copyWith(fontSize: 30),
                      ))
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
                                generalList[index].toString(),
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

                                      var box = Hive.box("general_box");
                                      List tempList = box.get("general") ?? [];
                                      tempList.remove(
                                          generalList[index].toString());
                                      box.put("general", tempList);
                                      generalList = box.get("general") ?? [];
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var txt = generalList[index].toString();
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
