import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentNotificationCard extends StatelessWidget {
  final String iconType; // Icon type based on enum
  final String message;

  StudentNotificationCard({required this.iconType, required this.message});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color bgColor;
    Color iconColor;

    if (iconType == "teacherAppliedAdvertisement") {
      icon = FontAwesomeIcons.userPlus;
      bgColor = Color(0xFF38BBF8);
      iconColor = Color(0xFF38BBF8);
    } else if (iconType == "teacherAcceptedOffer") {
      icon = FontAwesomeIcons.circleCheck;
      bgColor = Color(0xFF2EEE45);
      iconColor = Color(0xFF2EEE45);
    } else if (iconType == "teacherRejectedOffer") {
      icon = FontAwesomeIcons.circleXmark;
      bgColor = Color.fromARGB(255, 206, 50, 50);
      iconColor = Color(0xFFF82525);
    } else {
      // Handle other enum values if needed
      icon = FontAwesomeIcons.info; // Default icon
      bgColor = Colors.grey;
      iconColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 23),
          SizedBox(width: 7),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width - 48,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 5, 5),
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
