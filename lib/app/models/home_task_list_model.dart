import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String name;
  final String description;
  final String date;
  final String time;
  final String priority;
  // final String dependent;
  int dependent = 0;

  Task({
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.dependent,
    required this.priority,
  });

  static Task fromSnapshot(DocumentSnapshot snap) {
    if (snap.data().toString().contains('dependent')) {}
    print('hello hello');
    print(snap['name']);
    Task task = Task(
      name: snap['name'],
      description: snap['description'],
      time: snap['time'],
      priority: snap['priority'],
      dependent: (snap.data().toString().contains('dependent')
          ? snap['dependent'].length
          : 0),
      date: snap['date'],
    );
    return task;
  }
}
