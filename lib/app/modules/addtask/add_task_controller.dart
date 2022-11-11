import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/add_task_children_list_model.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindmi/app/services/firestore_db.dart';

class AddTaskController extends GetxController {
  final getStorage = GetStorage();
  var isLoading = false.obs;
  var isSuccess = false.obs;
  var selectedPriority = 'Select Priority'.obs;
  List<String> priorityList = [
    'Select Priority',
    'High',
    'Medium',
    'Low',
  ];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  TextEditingController selectedDate = TextEditingController();
  TextEditingController selectedTime = TextEditingController();
  final dependents = <Dependent>[].obs;
  List selectedDependents = [].obs;
  @override
  void onInit() {
    dependents.bindStream(FireStoreDB().getAllDependentAddTask());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    reset();
    super.onClose();
  }

  reset() {
    selectedDependents = [].obs;
  }

  void onAddTask(
    String taskName,
    String taskDescription,
  ) async {
    isLoading.value = true;
    if (taskName != '') {
      if (taskDescription != '') {
        if (selectedPriority.value != 'Select Priority') {
          if (selectedDate.text != '') {
            if (selectedTime.text != '') {
              if (selectedDependents.isNotEmpty) {
                try {
                  CollectionReference ref =
                      FirebaseFirestore.instance.collection('tasks');
                  ref.add({
                    'parent': getStorage.read('id'),
                    'name': taskName,
                    'description': taskDescription,
                    'date': selectedDate.text,
                    'dependent': selectedDependents,
                    'time': selectedTime.text,
                    'priority': selectedPriority.value
                  });
                  isLoading.value = false;
                  showCustomSnackBarSuccess("Task added successfully",
                      title: "success");
                  isSuccess.value = true;
                  reset();
                  Get.offAllNamed(Routes.BOTTOMNAVIGATIION);
                  print(
                      "################################################################### post details to fire store");
                } catch (e) {
                  isLoading.value = false;
                  showCustomSnackBar('Unexpected error occured',
                      title: "Error");
                }
              } else {
                isLoading.value = false;
                showCustomSnackBar('Dependent is required', title: "Error");
              }
            } else {
              isLoading.value = false;
              showCustomSnackBar('Time is required', title: "Error");
            }
          } else {
            isLoading.value = false;
            showCustomSnackBar('Date is required', title: "Error");
          }
        } else {
          isLoading.value = false;
          showCustomSnackBar('Priority is required', title: "Error");
        }
      } else {
        isLoading.value = false;
        showCustomSnackBar('Description is required', title: "Error");
      }
    } else {
      isLoading.value = false;
      showCustomSnackBar('Task Name is required', title: "Error");
    }
  }

  void setSelectedPriority(String Value) {
    print(Value);
    selectedPriority.value = Value;
  }
}
