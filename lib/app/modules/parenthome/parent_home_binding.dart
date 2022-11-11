//Connects view and controller files

import 'package:get/get.dart';
import 'package:remindmi/app/modules/parenthome/parent_home_controller.dart';

class ParentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentHomeController>(
      () => ParentHomeController(),
    );
  }
}
