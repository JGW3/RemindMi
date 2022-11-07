import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDependentController extends GetxController {
  final getStorge = GetStorage();
  var emailError = "".obs;
  final _auth = FirebaseAuth.instance;
  var passwordVisibility = true.obs;
  var cPasswordVisibility = true.obs;
  var isLoading = false.obs;
  var termChecked = false.obs;
  var isSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  TogglePasswordVisibility() {
    if (passwordVisibility.value == true) {
      passwordVisibility.value = false;
    } else {
      passwordVisibility.value = true;
    }
  }

  ToggleCPasswordVisibility() {
    if (cPasswordVisibility.value == true) {
      cPasswordVisibility.value = false;
    } else {
      cPasswordVisibility.value = true;
    }
  }

  ToggleTermChecked() {
    if (termChecked.value == true) {
      termChecked.value = false;
    } else {
      termChecked.value = true;
    }
    print("term is clicked");
    print(termChecked);
  }

  void addDependent(
      String fullName, String email, String password, String CPassword) async {
    isLoading.value = true;
    print("#############################################");
    print(fullName);
    print(email);
    // print(role);
    print(getStorge.read('id'));

    if (termChecked.value == true) {
      if (fullName != '') {
        if (password == CPassword) {
          await _auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) =>
                  {postDetailsToFirestore(fullName, email, 'dependent')})
              .catchError((e) {
            print(e);
            if (e.code == 'email-already-in-use') {
              isLoading.value = false;

              // emailError.value = "User Already Registered !";
              showCustomSnackBar("User Already Registered", title: "Email");
            } else if (e.code == 'unknown') {
              isLoading.value = false;
              showCustomSnackBar("Please fill all the fields", title: "Error");
            } else {
              isLoading.value = false;
              showCustomSnackBar(e.code, title: "Error");
            }
          });
        } else {
          isLoading.value = false;
          showCustomSnackBar("Confirm Password didn't matched !",
              title: "Error");
        }
      } else {
        isLoading.value = false;
        showCustomSnackBar("Please fill all the fields", title: "Error");
      }
    } else {
      isLoading.value = false;
      showCustomSnackBar("Please accept the terms and condition first! ",
          title: "Terms & Condition");
    }
  }

  postDetailsToFirestore(String fullName, String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref =
        FirebaseFirestore.instance.collection('dependent');
    isLoading.value = false;
    showCustomSnackBarSuccess("Account created successfully", title: "success");
    print("#############################################");
    print(fullName);
    print(email);
    print(role);
    print(getStorge.read('id'));
    ref.doc(user!.uid).set({
      'parent': getStorge.read('id'),
      'fullName': fullName,
      'email': email,
      'role': role
    });
    print(
        "################################################################### post details to fire store");
    isSuccess.value = true;
    Get.offAllNamed(Routes.BOTTOMNAVIGATIION);
  }
}
