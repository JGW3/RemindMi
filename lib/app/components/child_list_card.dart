import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/addtask/add_task_controller.dart';
import 'package:remindmi/app/modules/home_task_list_page/home_task_list_controller.dart';
import 'package:remindmi/app/components/home_page_user_avatar.dart';
import 'package:remindmi/constants/images.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildListCard extends StatelessWidget {
  final AddTaskController child_list_controller = Get.find();

  // final Task task;
  final int index;

  ChildListCard({
    Key? key,
    // required this.home_task_list_controller,
    required this.index,
    // required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: CheckboxListTile(
          checkboxShape: CircleBorder(),
          side: BorderSide(
            color: Color.fromARGB(255, 24, 90, 219),
            width: 1.5,
          ),
          activeColor: Color.fromARGB(255, 24, 90, 219),
          controlAffinity: ListTileControlAffinity.leading,
          value: child_list_controller.selectedDependents
              .contains(child_list_controller.dependents[index].id),
          onChanged: (value) {
            print(value);
            if (value == true) {
              child_list_controller.selectedDependents
                  .add(child_list_controller.dependents[index].id);
            } else {
              child_list_controller.selectedDependents
                  .remove(child_list_controller.dependents[index].id);
            }
          },
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          child_list_controller.dependents[index].name,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color.fromARGB(255, 218, 218, 218),
              //         blurRadius: 10,
              //         offset: Offset(0, 4),
              //       )
              //     ]),
            ),
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 20,
    //     vertical: 10,
    //   ),
    //   child: Row(
    //     children: [
    //       Text(home_task_list_controller.tasks[index].name),
    //     ],
    //   ),
    // );
  }
}
//  Text(home_task_list_controller.tasks[index].name),
