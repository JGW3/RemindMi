//View for sign in/sign up page

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage_view extends StatefulWidget {
  const LandingPage_view({super.key});

  @override
  State<LandingPage_view> createState() => _LandingPage_viewState();
}

class _LandingPage_viewState extends State<LandingPage_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 65.h,
          ),
          Container(
            child: Text("Let's go",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700, fontSize: 41.sp)),
          ),
          SizedBox(
            height: 115.h,
          ),
          Align(
            child: Image.asset(
              'assets/images/landing.png',
              height: 383.h,
              width: 430.w,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
            width: 398.w,
            height: 60.h,
            child: RawMaterialButton(
              fillColor: Color.fromRGBO(24, 90, 219, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r)),
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text("Sign in",
                  style: GoogleFonts.dmSans(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
            width: 398.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0.r),
                border: Border.all(color: Color.fromRGBO(24, 90, 219, 1.0))),
            child: RawMaterialButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: Text("Sign up",
                  style: GoogleFonts.dmSans(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(24, 90, 219, 1.0))
                  // style: TextStyle(
                  //     color: Color.fromRGBO(24, 90, 219, 1.0),
                  //     fontSize: 20.0,
                  //     fontFamily: 'DM Sans',
                  //     fontWeight: FontWeight.w500),

                  ),
            ),
          ),
          SizedBox(
            height: 62.h,
          )
        ],
      ),
    ));
  }
}
