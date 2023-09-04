import 'package:baidar_app/models/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class YearsLike extends StatefulWidget {
  const YearsLike({super.key});

  @override
  State<YearsLike> createState() => _YearsLikeState();
}

class _YearsLikeState extends State<YearsLike> {
  List gettedList = [];
  ftn() async {
    var box = Hive.box("info_box");
    gettedList = box.get("info");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ftn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   actionsIconTheme: const IconThemeData(color: Colors.white),
        //   title: Text(
        //     "Liked Year Information",
        //     style: textStyle.copyWith(fontSize: 20),
        //   ),
        //   iconTheme: const IconThemeData(color: Colors.white),
        //   backgroundColor: const Color.fromRGBO(2, 140, 127, 1),
        // ),

        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) {
        //         return MonthLike();
        //       }));
        //     },
        //     child: Text("Month")),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) {
        //         return MathLike();
        //       }));
        //     },
        //     child: Text("Math")),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) {
        //         return GeneralLike();
        //       }));
        //     },
        //     child: Text("General")),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) {
        //         return RandomLike();
        //       }));
        //     },
        //     child: Text("Random")),

        Expanded(
          child: ListView.builder(
              itemCount: gettedList.length,
              itemBuilder: (context, index) {
                return gettedList.isEmpty
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
                                gettedList[index].toString(),
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

                                      var box = Hive.box("info_box");
                                      List tempList = box.get("info") ?? [];
                                      tempList
                                          .remove(gettedList[index].toString());
                                      box.put("info", tempList);
                                      gettedList = box.get("info") ?? [];
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var txt = gettedList[index].toString();
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
