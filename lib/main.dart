import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school_management_system/screens/student_screens/student_dashboard.dart';
import 'package:school_management_system/services/local_storage.dart';

import 'screens/common_screens/splash_screen.dart';
import 'screens/common_screens/login_screen.dart';
import 'screens/temp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LocalStorageService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}



