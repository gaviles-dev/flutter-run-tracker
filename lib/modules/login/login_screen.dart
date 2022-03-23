import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_run_tracker/components/app_bottom_nav.dart';
import 'package:f_run_tracker/components/app_button.dart';
import 'package:f_run_tracker/components/app_header.dart';
import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:f_run_tracker/modules/home/home_screen.dart';
import 'package:f_run_tracker/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key key }) : super(key: key);
  LoginController lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ConfigTheme.primary,
      ),
      backgroundColor: ConfigTheme.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScreenHeader(),
          ],
        ),
      ),
      bottomNavigationBar: ScreenBottomNav(
        color: ConfigTheme.textLight,
        child: CustomButton(
          label: ConfigString.login_button,
          labelcolor: ConfigTheme.primary,
          onTap: () => lc.authenticate(),
        ),
      ),
    );
  }
}




