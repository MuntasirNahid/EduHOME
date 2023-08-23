import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ui_ux/pages/teacher/teacherNotification.dart';
import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
import '../../models/offer.dart';
import '../../widgets/tuitionOfferCard.dart';

class TuitionOffers extends StatefulWidget {
  const TuitionOffers({super.key});

  @override
  State<TuitionOffers> createState() => _TuitionOffersState();
}

class _TuitionOffersState extends State<TuitionOffers> {
  List<Offer> offers = [];

  @override
  void initState() {
    super.initState();
    fetchTuitionOffers();
  }

  Future<void> fetchTuitionOffers() async {
    try {
      List<Offer> fetchedOffers = await ApiService()
          .fetchPendingOffersForTeacher(
              "64d8e7d6b7f46ededc395c1e"); //giving teacherID
      setState(() {
        offers = fetchedOffers;
      });
    } catch (e) {
      print('Error fetching tuition offers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi!',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Muntasir Mamun',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => teacherNotification(),
                  ),
                );
              },
              icon: Icon(Icons.notifications_active_outlined),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Offers',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 05),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: offers.length,
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemBuilder: (context, index) {
                  return TuitionOfferCard(
                    studentName: offers[index].studentName,
                    studentClass: offers[index].classNumber,
                    location: offers[index].location,
                    note: offers[index].note,
                    onAcceptPressed: () async {
                      bool success = await ApiService()
                          .acceptTuitionOffer(offers[index].studentId);
                      if (success) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Success",
                          desc: "Offer Accepted Successfully.",
                          btnOkOnPress: () {
                            // Implement your logic after accepting the offer
                          },
                        ).show();
                        setState(() {
                          offers.removeAt(
                              index); // Remove the accepted offer from the list
                        });
                      }
                    },
                    onRejectPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Warning",
                        desc: "Are you sure you want to reject the Offer?",
                        btnCancelOnPress: () {},
                        btnOkText: "Yes",
                        btnOkOnPress: () async {
                          bool success = await ApiService()
                              .rejectTuitionOffer(offers[index].studentId);

                          if (success) {
                            setState(() {
                              offers.removeAt(
                                  index); // Remove the rejected offer from the list
                            });
                          }
                        },
                      ).show();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
