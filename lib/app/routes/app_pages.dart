import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/addDependent/add_dependent_binding.dart';
import 'package:remindmi/app/modules/addDependent/add_dependent_view.dart';
import 'package:remindmi/app/modules/addtask/add_task_binding.dart';
import 'package:remindmi/app/modules/addtask/add_task_view.dart';
import 'package:remindmi/app/modules/childrenhome/children_home_view.dart';
import 'package:remindmi/app/modules/childrenhome/children_home_binding.dart';
import 'package:remindmi/app/modules/forgotpassword/forgotpassword_binding.dart';
import 'package:remindmi/app/modules/forgotpassword/forgotpassword_view.dart';
import 'package:remindmi/app/modules/landing_page/landingPage_binding.dart';
import 'package:remindmi/app/modules/landing_page/landingPage_view.dart';
import 'package:remindmi/app/modules/login/login_binding.dart';
import 'package:remindmi/app/modules/login/login_view.dart';
import 'package:remindmi/app/modules/manage/manage_binding.dart';
import 'package:remindmi/app/modules/manage/manage_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_nagivation_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_navigation_binding.dart';
import 'package:remindmi/app/modules/parenthome/parent_home_binding.dart';
import 'package:remindmi/app/modules/parenthome/parent_home_view.dart';
import 'package:remindmi/app/modules/signup/signup_view.dart';
import 'package:remindmi/app/modules/signup/signup_binding.dart';
import 'package:remindmi/app/modules/splash/splash_binding.dart';
import 'package:remindmi/app/modules/splash/splash_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PARENTHOME,
      page: () => const ParentHomeView(),
      binding: ParentHomeBinding(),
    ),
    GetPage(
      name: _Paths.CHILDRENHOME,
      page: () => const ChildrenHomeView(),
      binding: ChildrenHomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDINGPAGE,
      page: () => const LandingPage_view(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotPassword_view(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGATIION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.ADDTASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE,
      page: () => ManageView(),
      binding: ManageBinding(),
    ),
    GetPage(
      name: _Paths.ADDDEPENDENT,
      page: () => AddDependentView(),
      binding: AddDependentBinding(),
    ),
  ];
}
