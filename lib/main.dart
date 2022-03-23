import 'package:f_run_tracker/modules/home/home_screen.dart';
import 'package:f_run_tracker/modules/login/login_controller.dart';
import 'package:f_run_tracker/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController lc = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distance Run Tracker',
      home: lc.user == null ? LoginScreen() : HomeScreen(),
    );
  }
}
