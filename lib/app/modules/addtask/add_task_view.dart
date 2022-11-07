import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/modules/addtask/add_task_controller.dart';
import 'package:remindmi/app/components/child_list_card.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  AddTaskController addTaskController = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    TextEditingController _taskNameController = TextEditingController(text: '');
    TextEditingController _dateController = TextEditingController(text: '');
    TextEditingController _taskDescriptionController =
        TextEditingController(text: '');

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Add Task',
              style: GoogleFonts.dmSans(
                  fontSize: 36.0, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // decoration: BoxDecoration(
            //     color: Color.fromRGBO(238, 239, 241, 1),
            //     borderRadius: BorderRadius.circular(8)),

            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              style:
                  GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.text,
              controller: _taskNameController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 19),
                //Change this value to custom as you like
                isDense: true,
                hintText: "Task Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                      255,
                      101,
                      152,
                      254,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                      255,
                      101,
                      152,
                      254,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            // decoration: BoxDecoration(
            //     color: Color.fromRGBO(238, 239, 241, 1),
            //     borderRadius: BorderRadius.circular(8)),
            height: 156,

            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              style:
                  GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              controller: _taskDescriptionController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 19),
                //Change this value to custom as you like
                isDense: true,
                hintText: "Task Description",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                      255,
                      101,
                      152,
                      254,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 101, 152, 254),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),

          // Container(
          //     child: DropdownButton<String>(
          //   // items: <String>['High', 'Medium', 'Low'].map((String value) {
          //   // var pvalue = ['high', 'medium', 'low'];
          //   items: addTaskController.priorityList.map((String value) {
          //     print(value);
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (String? value) {
          //     print('###########################');
          //     print(value);
          //     addTaskController.priority.value = value;
          //     print(addTaskController.priority.value);
          //   },
          // )),

          Obx(
            () => Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: EdgeInsets.symmetric(),
              child: DropdownButton<String>(
                // dropdownColor: Color.fromARGB(255, 101, 152, 254),
                borderRadius: BorderRadius.circular(8.0),
                iconEnabledColor: Color.fromARGB(255, 101, 152, 254),
                iconDisabledColor: Colors.grey,

                underline: SizedBox(),
                isExpanded: true,
                value: addTaskController.selectedPriority.value,
                items: [
                  for (var data in addTaskController.priorityList)
                    DropdownMenuItem(
                        child: new Text('    ' + data,
                            style: GoogleFonts.dmSans(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        value: data),
                ],
                onChanged: (newValue) {
                  addTaskController.setSelectedPriority(newValue!);
                },
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 101, 152,
                      254), //                   <--- border color
                  // width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  subtitle: TextFormField(
                      readOnly: true,
                      controller: addTaskController.selectedDate,
                      decoration: InputDecoration(
                        hintText: 'Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(
                              255,
                              101,
                              152,
                              254,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(
                              255,
                              101,
                              152,
                              254,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 5));
                        if (pickedDate != null) {
                          addTaskController.selectedDate.text =
                              '${pickedDate.month}/${pickedDate.day}/${pickedDate.year}';
                        }
                      }),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: ListTile(
                  subtitle: TextFormField(
                      readOnly: true,
                      controller: addTaskController.selectedTime,
                      decoration: InputDecoration(
                        hintText: "Time",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(
                              255,
                              101,
                              152,
                              254,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(
                              255,
                              101,
                              152,
                              254,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          // firstDate: DateTime.now(),
                          // lastDate: DateTime(DateTime.now().year + 5)
                        );
                        if (pickedTime != null) {
                          addTaskController.selectedTime.text =
                              pickedTime.format(context);
                          // '${pickedTime.hour}:${pickedTime.minute}';
                        }
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Assign to',
              style: GoogleFonts.dmSans(
                  fontSize: 22.0, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  itemCount: addTaskController.dependents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChildListCard(
                      index: index,
                    );
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 38),
            width: 398,
            height: 60,
            child: Align(
              child: Obx(
                () => RawMaterialButton(
                  fillColor: Color.fromRGBO(24, 90, 219, 1.0),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {
                    // print(
                    //   _taskNameController.text,
                    // );
                    addTaskController.onAddTask(_taskNameController.text,
                        _taskDescriptionController.text);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (addTaskController.isLoading.value == true) ...[
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        )
                      ],
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Add Task",
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
            ),
          ),
        ],
      ),
    ));
  }

// Future pickDate(BuildContext context) async {
//   DateTime date;

//   final intialDate = DateTime.now();
// final newDate = await showDatePicker(
//     context: context,
//     initialDate: intialDate,
//     firstDate: DateTime(DateTime.now().year - 5),
//     lastDate: DateTime(DateTime.now().year + 5));
//   if (newDate == null) return;
//   setState(() => _dateController = newDate);
// }
}
