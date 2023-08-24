import 'package:eduhome_project/firebase_options.dart';
import 'package:eduhome_project/pages/authenticate/email_verification.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:eduhome_project/pages/authenticate/teacher_register.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:eduhome_project/services/storage_repo.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eduhome_project/pages/authenticate/email_verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthenticationRepository());
    Get.put(StorageRepo());
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/studentHome',
      // routes: {
      //   '/studentNotifications': (context) => studentNotification(),
      //   '/studentHome': (context) => studentHome(),
      // },
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: landingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
