import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'app/routes/app_pages.dart';

import 'package:remindmi/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyAjHrEgelTJnSA95ucyZME2N3tM43S0JVw",
      //   appId: "1:526204885343:android:27fe86d00f0ff83bf8beea",
      //   messagingSenderId: "526204885343",
      //   projectId: "remindmi-ab6c6",
      // ),
      );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: "RemindMi",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
