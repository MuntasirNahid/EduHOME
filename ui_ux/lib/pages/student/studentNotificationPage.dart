import 'package:flutter/material.dart';
import 'package:ui_ux/models/notification.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/widgets/student/notification_card.dart';

class studentNotification extends StatefulWidget {
  const studentNotification({super.key});

  @override
  State<studentNotification> createState() => _studentNotificationState();
}

class _studentNotificationState extends State<studentNotification> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    // Fetch notifications from the API
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      final fetchedNotifications = await ApiService()
          .fetchStudentNotifications('64d9bd2ccfe6020e4cfc8ef3');
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
      body: Column(
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
                      return StudentNotificationCard(
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
    );
  }
}
