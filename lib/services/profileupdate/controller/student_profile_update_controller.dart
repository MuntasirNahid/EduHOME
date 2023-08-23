import 'dart:io';

import 'package:eduhome_project/constants/Colors.dart';
import 'package:eduhome_project/models/Student.dart';
import 'package:eduhome_project/pages/authenticate/email_verification.dart';
import 'package:eduhome_project/pages/landing/studentLanding.dart';
import 'package:eduhome_project/provider/student_provider.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:eduhome_project/services/data_repository.dart';
import 'package:eduhome_project/services/storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class StudentProfileUpdate extends GetxController {
  static StudentProfileUpdate get instance => Get.find();

  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final classStudies = TextEditingController();
  final location = TextEditingController();
  final institution = TextEditingController();
  final picturePath = TextEditingController();

  Future<void> updateStudentProfile(Student data) async {
    try {
      await DataRespository.updateStudentData(data);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString(),
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  Future<void> uploadProfilePicture(XFile file) async {
    String filename = "sunny";
    var downloadUrl =
        await StorageRepo.instance.uploadFile(file, filename) as String;

    StudentUser.currentStudent?.picturePath = downloadUrl.toString();
    print("Image URL :" + downloadUrl);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
