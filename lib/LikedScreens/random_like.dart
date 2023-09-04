import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class RandomLike extends StatefulWidget {
  const RandomLike({super.key});

  @override
  State<RandomLike> createState() => _RandomLikeState();
}

class _RandomLikeState extends State<RandomLike> {
  List randomList = [];
  randomFunction() async {
    var box = Hive.box("randomm_box");
    randomList = box.get("randomm");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    randomFunction();
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
              itemCount: randomList.length,
              itemBuilder: (context, index) {
                return randomList.isEmpty
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
                                randomList[index].toString(),
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

                                      var box = Hive.box("randomm_box");
                                      List tempList = box.get("randomm") ?? [];
                                      tempList
                                          .remove(randomList[index].toString());
                                      box.put("randomm", tempList);
                                      randomList = box.get("randomm") ?? [];
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var txt = randomList[index].toString();
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
