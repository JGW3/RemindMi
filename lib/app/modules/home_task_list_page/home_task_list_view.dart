import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/components/task_list_card.dart';
import 'package:remindmi/app/components/task_view.dart';
import 'package:remindmi/app/helper/utils.dart';
import 'package:remindmi/app/modules/addtask/add_task_view.dart';
import 'package:remindmi/app/modules/home_task_list_page/home_task_list_controller.dart';

class HomeTaskListViews extends StatefulWidget {
  @override
  State<HomeTaskListViews> createState() => _HomeTaskListViewsState();
}

class _HomeTaskListViewsState extends State<HomeTaskListViews> {
  final home_task_controller = Get.put(HomeTaskListController());
  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 133,
      //   elevation: 0,
      //   title: Column(
      //     children: [
      //       SizedBox(
      //         height: 32.h,
      //       ),
      //       Container(
      //           margin: EdgeInsets.fromLTRB(0.w, 38.h, 0.w, 0.h),
      //           child: Align(
      //             alignment: Alignment.centerLeft,
      //             child: RichText(
      //               text: TextSpan(
      //                 text: 'Hi ',
      //                 style: GoogleFonts.dmSans(
      //                     fontSize: 32.sp,
      //                     fontWeight: FontWeight.w700,
      //                     color: Color.fromARGB(255, 0, 0, 0)),
      //                 children: <InlineSpan>[
      //                   TextSpan(
      //                     text: GetFirtsName(getStorage.read('fullName')),
      //                     style: GoogleFonts.dmSans(
      //                         fontSize: 32.sp,
      //                         fontWeight: FontWeight.w700,
      //                         color: Color.fromARGB(255, 0, 0, 0)),
      //                   ),
      //                   WidgetSpan(
      //                       alignment: PlaceholderAlignment.middle,
      //                       child: Container(
      //                         margin:
      //                             EdgeInsets.fromLTRB(18.25.w, 0.h, 0.w, 0.h),
      //                         child: Image.asset(
      //                           'assets/images/emoji.png',
      //                           height: 35.h,
      //                           width: 35.w,
      //                         ),
      //                       )),
      //                 ],
      //               ),
      //             ),
      //           )),
      //       SizedBox(
      //         height: 11.h,
      //       ),
      //       Container(
      //         margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
      //         child: Align(
      //             alignment: Alignment.centerLeft,
      //             child: RichText(
      //               text: TextSpan(children: <InlineSpan>[
      //                 WidgetSpan(
      //                     alignment: PlaceholderAlignment.middle,
      //                     child: Container(
      //                       padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
      //                       margin: EdgeInsets.fromLTRB(0.w, 0.h, 11.w, 0.h),
      //                       child: Image.asset(
      //                         'assets/images/chotu.png',
      //                         height: 39.h,
      //                         width: 39.w,
      //                       ),
      //                     )),
      //                 TextSpan(
      //                   text: 'Running Task',
      //                   style: GoogleFonts.dmSans(
      //                     fontSize: 22.sp,
      //                     fontWeight: FontWeight.w500,
      //                     color: Color.fromARGB(255, 69, 69, 209),
      //                   ),
      //                 ),
      //               ]),
      //             )),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(16.w, 38.h, 0.w, 0.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Hi ',
                    style: GoogleFonts.dmSans(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    children: <InlineSpan>[
                      TextSpan(
                        text: GetFirtsName(getStorage.read('fullName')),
                        style: GoogleFonts.dmSans(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(18.25.w, 0.h, 0.w, 0.h),
                            child: Image.asset(
                              'assets/images/emoji.png',
                              height: 35.h,
                              width: 35.w,
                            ),
                          )),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 11.h,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.w, 0.h, 0.w, 0.h),
            child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0.w, 0.h, 11.w, 0.h),
                          child: Image.asset(
                            'assets/images/chotu.png',
                            height: 39.h,
                            width: 39.w,
                          ),
                        )),
                    TextSpan(
                      text: 'Running Task',
                      style: GoogleFonts.dmSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 69, 69, 209),
                      ),
                    ),
                  ]),
                )),
          ),
          Expanded(
            // child: SingleChildScrollView(
            // child: Container(
            // height: 768.h,
            // width: 430.h,
            // decoration:
            //     BoxDecoration(color: Color.fromARGB(255, 244, 244, 244)),
            child: Obx(
              () => GestureDetector(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemCount: home_task_controller.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskListCard(
                        index: index,
                      );
                    },
                  ),
                  onLongPress: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return TaskViewCard();
                        });
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 3, 163, 0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        icon: Icon(Icons.add_circle_outlined),
        label: Text(
          'Add Task',
          style: GoogleFonts.dmSans(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Get.to(AddTaskView());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
//  child: Obx(
//           () => ListView.builder(
//               itemCount: home_task_controller.tasks.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return TaskListCard(
//                   index: index,
//                 );
//               }),
//         ),