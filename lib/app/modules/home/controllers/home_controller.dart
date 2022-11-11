//Backend for homepage

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = "";
  var id = "";
  var role = "";
  @override
  void onInit() {
    super.onInit();
    name = getStorage.read("name");
    id = getStorage.read("id");
    role = getStorage.read("role");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  logout() {
    Get.offAllNamed(Routes.LOGIN);
    getStorage.erase();
  }
}
