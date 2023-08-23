import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/provider/student_provider.dart';
import 'package:eduhome_project/provider/teacher_provider.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  Future<void> logoutUser() async {
    try {
      await AuthenticationRepository.instance.logout();

      StudentUser.currentStudent = null;

      TeacherUser.currentTeacher = null;
    } catch (e) {
      ;
    }
  }
}
