import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// class PriorityHighColor {
//   static const border = Colors.red;
//   static const title = Colors.red;
//   static const subtitle = Color.fromARGB(255, 247, 83, 72);
// }

// class PriorityMediumColor {
//   static const border = Colors.red;
// }

// class PriorityLowColor {
//   static const border = Colors.red;
// }

// class PriorityColor {
//   dynamic border(String priority) {
//     return Colors.red;
//   }
// }

dynamic priorityBorder(String priority) {
  if (priority == 'High') {
    return Colors.red;
  } else if (priority == 'Medium') {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}

dynamic priorityTitile(String priority) {
  if (priority == 'High') {
    return Colors.red;
  } else if (priority == 'Medium') {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}

dynamic prioritySubTitle(String priority) {
  if (priority == 'High') {
    return Color.fromARGB(255, 247, 109, 100);
  } else if (priority == 'Medium') {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}
