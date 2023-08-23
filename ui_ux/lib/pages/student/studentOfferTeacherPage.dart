import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;

class OfferTeacher extends StatefulWidget {
  final String teacherId;

  const OfferTeacher({
    required this.teacherId,
  });

  @override
  State<OfferTeacher> createState() => _OfferTeacherState();
}

class _OfferTeacherState extends State<OfferTeacher> {
  int clickCount = 0;
  bool showOfferDialog = true;
  TextEditingController noteController = TextEditingController();

  void _onButtonPressed() async {
    setState(
      () {
        if (clickCount % 2 == 0) {
          clickCount++;
          showOfferDialog = false;
        } else {
          clickCount++;
          showOfferDialog = true;
        }
      },
    );

    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.0.103:4002/api/student/64d9bd2ccfe6020e4cfc8ef3/offer/${widget.teacherId}'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"note": noteController.text}),
      );

      if (response.statusCode == 200) {
        // Offer created/updated successfully
        // Handle success here
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    }
  }

  void _onCancelButtonPressed() async {
    setState(
      () {
        if (clickCount % 2 == 0) {
          clickCount++;
          showOfferDialog = false;
        } else {
          clickCount++;
          showOfferDialog = true;
        }
      },
    );

    try {
      final response = await http.delete(
        Uri.parse(
            'http://192.168.0.103:4002/api/student/64d9bd2ccfe6020e4cfc8ef3/offercancel/${widget.teacherId}'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // Offer created/updated successfully
        // Handle success here
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    }
  }

  Color getButtonColor() {
    return clickCount % 2 == 1 ? Colors.red : Color(0xFF00BFA5);
  }

  String getButtonText() {
    return clickCount % 2 == 0 ? "OFFER" : "CANCEL OFFER";
  }

  void showAppropriateDialog(BuildContext context) {
    if (showOfferDialog) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "Success",
        desc: "Offer Sent Successfully.",
        btnOkOnPress: () {
          _onButtonPressed();
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "Warning",
        desc: "Are you sure you want to cancel the Offer?",
        btnCancelOnPress: () {},
        btnOkText: "Yes",
        btnOkOnPress: () {
          _onCancelButtonPressed();
        },
      ).show();
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
                    '< Offer',
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
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                  ),
                  radius: 50,
                ),
                Positioned(
                  bottom:
                      0, // Adjust this value to position the container vertically
                  right:
                      0, // Adjust this value to position the container horizontally
                  child: Container(
                    height: 26,
                    width: 45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF38BBF8),
                            ),
                            Text(
                              '4',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 219, 109, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Mostahid Hasan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(
            height: 20,
            color: Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            width: 325,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.pen,
                  size: 20,
                ),
                border: InputBorder.none,
                hintText: 'Note(If Any)',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            child: AnimatedButton(
              text: getButtonText(),
              color: getButtonColor(),
              pressEvent: () {
                showAppropriateDialog(context);
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Text('OFFER'),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(
          //       Color(0xFF00BFA5),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
