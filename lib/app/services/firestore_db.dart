import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindmi/app/models/add_task_children_list_model.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';
import 'package:get_storage/get_storage.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final getStorge = GetStorage();

  Stream<List<Task>> getAllTasks() {
    print('from db');
    var test = _firebaseFirestore
        .collection('tasks')
        .where('parent', isEqualTo: getStorge.read("id"))
        // .where('user', isEqualTo: 'n1lgY6xH3OYiXVXNckK3s0b2dj62')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList();
    });

    return test;
  }

  Stream<List<Dependent>> getAllDependentAddTask() {
    print('from db');
    var test = _firebaseFirestore
        .collection('dependent')
        .where('parent', isEqualTo: getStorge.read("id"))
        // .where('user', isEqualTo:'n1lgY6xH3OYiXVXNckK3s0b2dj62')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Dependent.fromSnapshot(doc)).toList();
    });

    return test;
  }
}
