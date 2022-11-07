import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

import 'package:remindmi/app/services/firestore_db.dart';

class HomeTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;

  // var _home_tasks ={}.obs;

  @override
  void onInit() {
    tasks.bindStream(FireStoreDB().getAllTasks());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
