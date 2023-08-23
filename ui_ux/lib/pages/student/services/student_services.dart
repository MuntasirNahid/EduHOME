import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ui_ux/models/advertisement.dart';
import 'package:ui_ux/models/teacher.dart';
import 'package:ui_ux/models/notification.dart';

class ApiService {
  final String baseUrl = 'http://192.168.0.103:4002';

  Future<List<Teacher>> getALlTeachers(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/student/getAllTeachers'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Teacher> teacherList = List<Teacher>.from(
          data.map((json) => Teacher.fromJson(json)),
        );
        return teacherList;
      } else {
        throw Exception('Failed to fetch teacher list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Teacher>> getAllApplicants(String advertisementId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/student/$advertisementId/applicants'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Teacher> applicantList = List<Teacher>.from(
          data.map((json) => Teacher.fromJson(json)),
        );
        return applicantList;
      } else {
        throw Exception('Failed to fetch applicant list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Teacher>> fetchMyTeachersForStudent(String studentId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/student/64d9bd2ccfe6020e4cfc8ef3/myTeachers'),

        //for checking purpose
        //  Uri.parse('$baseUrl/api/teacher/$teacherId/myTeachers'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Teacher> myTeachers =
            jsonData.map((json) => Teacher.fromJson(json)).toList();
        return myTeachers;
      } else {
        throw Exception(
            'Failed to fetch Teachers for student: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Teachers for student: $e');
    }
  }

  Future<bool> updateStudentProfile(
      String studentId, Map<String, dynamic> updateData) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/api/student/$studentId/Profile'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updateData),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Advertisement> updateAdvertisement(
      String advertisementId, Map<String, dynamic> updateData) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/api/student/$advertisementId/updateTuitionPost'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateData),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Advertisement updatedAdvertisement =
            Advertisement.fromJson(responseData['advertisement']);

        return updatedAdvertisement;
      } else {
        throw Exception('Failed to update advertisement');
      }
    } catch (error) {
      throw Exception('Failed to update advertisement');
    }
  }

  Future<Map<String, dynamic>> postTuitionAdvertisement(
      Advertisement advertisement) async {
    try {
      final response = await http.post(
        Uri.parse(
            '$baseUrl/api/student/64d9bd2ccfe6020e4cfc8ef3/postAdvertisement'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(advertisement.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  Future<List<Advertisement>> fetchMyAdvertisements(String studentId) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/api/student/64d9bd2ccfe6020e4cfc8ef3/advertisements'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Advertisement> myAdvertisements =
            jsonData.map((json) => Advertisement.fromJson(json)).toList();
        return myAdvertisements;
      } else {
        throw Exception(
            'Failed to fetch Advertisements for student: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Advertisements for student: $e');
    }
  }

  Future<void> deleteAdvertisement(String advertisementId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            '$baseUrl/api/student/64d9bd2ccfe6020e4cfc8ef3/advertisement/$advertisementId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 204) {
        return;
      } else {
        throw Exception('Failed to delete advertisement');
      }
    } catch (e) {
      throw Exception('Error deleting advertisement: $e');
    }
  }

  Future<bool> acceptApplicant(String teacherId, String advertisementId) async {
    try {
      final response = await http.post(
        Uri.parse(
            '$baseUrl/api/student/64d9bd2ccfe6020e4cfc8ef3/$advertisementId/applicants/$teacherId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        Advertisement updatedAdvertisement =
            Advertisement.fromJson(responseData['updatedAdvertisement']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<NotificationModel>> fetchStudentNotifications(
      String studentId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/student/$studentId/notifications'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<NotificationModel> notifications =
            jsonData.map((json) => NotificationModel.fromJson(json)).toList();
        return notifications;
      } else {
        throw Exception(
            'Failed to fetch notifications for student: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching notifications for student: $e');
    }
  }
}
