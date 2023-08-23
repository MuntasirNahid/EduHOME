import 'package:eduhome_project/models/Student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Teacher.dart';

class StudentUser {
  static Student? currentStudent = null;

  static Student? getCurrentStudentUser() {
    return StudentUser.currentStudent;
  }
}
