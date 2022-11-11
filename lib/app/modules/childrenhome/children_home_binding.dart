//Connects view and controller files

import 'package:get/get.dart';
import 'package:remindmi/app/modules/childrenhome/children_home_controller.dart';

class ChildrenHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildrenHomeController>(
      () => ChildrenHomeController(),
    );
  }
}
