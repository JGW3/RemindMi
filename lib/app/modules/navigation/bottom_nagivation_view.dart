import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/home_task_list_page/home_task_list_view.dart';
import 'package:remindmi/app/modules/login/login_view.dart';
import 'package:remindmi/app/modules/manage/manage_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNavigationController bottomNavigationBarController =
      Get.put(BottomNavigationController());
  BottomNavigationView({Key? key}) : super(key: key);
  final screens = [HomeTaskListViews(), ManageView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationBarController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color.fromARGB(255, 0, 74, 219),
          unselectedItemColor: Color.fromARGB(255, 169, 174, 183),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            bottomNavigationBarController.changeIndex(index);
          },
          currentIndex: bottomNavigationBarController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 34,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_accounts,
                size: 34,
              ),
              label: 'Manage',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
