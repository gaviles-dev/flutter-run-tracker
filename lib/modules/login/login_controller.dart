import 'package:f_run_tracker/modules/home/home_screen.dart';
import 'package:f_run_tracker/modules/login/login_screen.dart';
import 'package:f_run_tracker/modules/login/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

   final LoginService dataSrc = LoginService();
   User user = FirebaseAuth.instance.currentUser;

  authenticate() async {
    var _result = await dataSrc.signInAnon();
    if(_result != null){
      Get.to(() => HomeScreen());
    } else {
       Get.snackbar("Login Failed", "Please try again");
    }
  }

  signOut() async {
    await dataSrc.signOut();
    Get.to(() => LoginScreen());
  }

}