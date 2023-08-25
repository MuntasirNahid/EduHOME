import 'package:flutter/material.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/models/notification.dart';
import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'package:ui_ux/widgets/teacher_notification.dart';

class teacherNotification extends StatefulWidget {
  const teacherNotification({super.key});

  @override
  State<teacherNotification> createState() => _teacherNotificationState();
}

class _teacherNotificationState extends State<teacherNotification> {
  List<NotificationModel> notifications = [];

  String teacherId = '';

  Teacher? currentTeacher = TeacherUser.getCurrentTeacherUser();
  @override
  void initState() {
    super.initState();
    teacherId = currentTeacher!.id;

    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      final fetchedNotifications =
          await ApiService().fetchTeacherNotifications('$teacherId');
      setState(() {
        notifications = fetchedNotifications;
      });
    } catch (e) {
      // Handle error
      print('Error fetching notifications: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SafeArea(
                  child: TextButton(
                    child: Text(
                      '< Notifications',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return TeacherNotificationCard(
                          iconType: notifications[index].messageType,
                          message: notifications[index].message,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
