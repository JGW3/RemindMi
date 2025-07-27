import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';

class DependentTaskViewCard extends StatelessWidget {
  final int indexNo;
  final row;
  final getStorge = GetStorage();

  DependentTaskViewCard({
    Key? key,
    required this.indexNo,
    required this.row,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            )),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(18, 16, 0, 17),
                  child: Text(
                    row.name,
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.topRight,
                      child: new IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close))),
                ),
              ],
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'Assign From',
              style: GoogleFonts.dmSans(
                  fontSize: 22.0, fontWeight: FontWeight.w500),
            ),
          ),
          //parents list start
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(
                      255,
                      101,
                      152,
                      254,
                    ),
                    radius: 32,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.asset(
                        'assets/images/child.png',
                        height: 57,
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          row.parentName,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Container(
                          width: 120,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          padding: EdgeInsets.fromLTRB(17, 5, 15, 5),
                          child: Text(
                            'Assigner',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 56, 167),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(255, 237, 243, 255)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //parents list ends
          //task description starts

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 14, 0, 6),
            child: Text(
              'Task Description',
              style: GoogleFonts.dmSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 79, 89, 107)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(row.description,
                style: GoogleFonts.dmSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 0, 0, 6),
            child: Text(
              'Task Time',
              style: GoogleFonts.dmSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 79, 89, 107)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(row.time + ',' + row.date,
                style: GoogleFonts.dmSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 47, 16, 43),
            child: Row(
              children: [
                Expanded(
                  child: RawMaterialButton(
                    fillColor: Colors.green,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0)),
                    onPressed: () {
                      try {
                        row.dependentList
                            .firstWhere((element) =>
                                element.dep == getStorge.read('id'))
                            .depName;
                        var name = row.name;
                        var description = row.description;
                        var parent = row.parent;
                        var parentName = row.parentName;
                        var priority = row.priority;
                        var date = row.date;
                        var time = row.time;
                        var dependentList = row.depenListString;

                        print(dependentList);
                        dependentList.removeWhere((element) =>
                            element['dep'] == getStorge.read('id'));
                        dependentList.add({
                          'dep': getStorge.read('id'),
                          'depName': getStorge.read('fullName'),
                          'status': true
                        });
                        print(dependentList);

                        var ref = FirebaseFirestore.instance
                            .collection('tasks')
                            .doc(row.id);
                        ref.set({
                          'parent': parent,
                          'parentName': parentName,
                          'name': name,
                          'description': description,
                          'date': date,
                          'dependent': dependentList,
                          'time': time,
                          'priority': priority
                        });

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0)),
                                  side: BorderSide(color: Colors.black)),
                              backgroundColor: Colors.white,
                              title: Center(
                                child: Icon(
                                  Icons.done_all_rounded,
                                  size: 50,
                                  color: Colors.green,
                                ),
                              ),
                              content: Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Congratulations!!!",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 4.0,
                                    ),
                                    Text(
                                      "You have successfully completed the task. Keep up the good work!",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                RawMaterialButton(
                                  fillColor: Colors.white,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.green),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        32.0,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Close",
                                            style: GoogleFonts.dmSans(
                                                color: Colors.green,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        showCustomSnackBar(e.toString(), title: "Error");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.done, color: Colors.white),
                        Container(
                          height: 52,
                          alignment: Alignment.bottomCenter,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              " Completed",
                              style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 52,
                  width: 12,
                ),
                Expanded(
                  child: RawMaterialButton(
                    fillColor: Color.fromRGBO(255, 75, 75, 1.0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, color: Colors.white),
                        Container(
                          height: 52,
                          alignment: Alignment.bottomCenter,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              " Cancel",
                              style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    );
  }
}
