import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/student2.dart';
import 'package:ui_ux/models/teacher2.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/pages/student/studentNotificationPage.dart';
import 'package:ui_ux/pages/student/studentOfferTeacherPage.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/widgets/student/teacher_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class studentHome extends StatefulWidget {
  const studentHome({super.key});

  @override
  State<studentHome> createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ApiService _apiService = ApiService();

  List<Teacher2> teachers = [];

  String picturePath = '';
  String fullName = '';

  Student? currentStudent = StudentUser.getCurrentStudentUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    picturePath = currentStudent!.picturePath;
    fullName = currentStudent!.fullName;
    fetchTeachers();
  }

  Future<void> fetchTeachers() async {
    try {
      List<Teacher2> fetchedTeachers =
          await _apiService.getALlTeachers(context);
      setState(() {
        teachers = fetchedTeachers;
      });
    } catch (e) {
      print('Error fetching teachers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              'Welcome Back',
              style: TextStyle(
                color: Colors.black87,
                //     fontFamily: 'Poppins',
              ),
            ),
            Text(
              fullName,
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
                    builder: (context) => studentNotification(),
                  ),
                );
              },
              icon: Icon(Icons.notifications_active_outlined),
              color: Colors.black,
            ),
          ),
        ],
      ),

      endDrawer:
          MyDrawer(), //drawer for left side drawer, endDrawer for right side drawer
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    width: 325,
                    height: 40,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Teacher Name',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: FaIcon(FontAwesomeIcons.sliders,
                        color: Color(0xFF00BFA5)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Teachers',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: teachers.map((teacher) {
                    return TeacherListCard(
                      teacher: teacher,
                      teacherName: teacher.fullName,
                      subjects: teacher.teachingSubject.join(', '),
                      experience: teacher.experience,
                      salaryRange:
                          '${teacher.minSalary} - ${teacher.maxSalary}',
                      occupation: teacher.occupation,
                      education: teacher.institution,
                      subject:
                          teacher.subject.isNotEmpty ? teacher.subject : "",
                      location: teacher.location,
                      profileImage:
                          'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80', //teacher.picturePath,
                      onOfferPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferTeacher(
                              teacherId: teacher.id,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int clickPhysics = 0,
      clickMath = 0,
      clickChemistry = 0,
      clickEnglish = 0,
      clickBiology = 0,
      clickBangla = 0,
      clickMale = 0,
      clickFemale = 0,
      clickLessOne = 0,
      clickOneToThree = 0,
      clickThreeToFive = 0,
      clickFiveToSeven = 0,
      clickSevenPlus = 0,
      click2k = 0,
      click3k = 0,
      click7k = 0,
      click5k = 0,
      click10k = 0,
      click1s = 0,
      click2s = 0,
      click3s = 0,
      click4s = 0,
      click5s = 0;
  // Color buttonColor = Colors.grey;

  int _onButtonPressed(int clickCount) {
    int clickCounter = clickCount;
    setState(
      () {
        clickCounter++;
      },
    );
    return clickCounter;
  }

  Color getButtonColor(int clickCount) {
    return clickCount % 2 == 0 ? Colors.grey : Color(0xFF00BFA5);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.blueGrey[200],
          child: ListView(
            //  padding: EdgeInsets.zero,

            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(FontAwesomeIcons.circleXmark),
                color: const Color(0xFFF82525),
                padding: EdgeInsets.fromLTRB(0, 0, 270, 2),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Subject',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            clickPhysics = _onButtonPressed(clickPhysics);
                          },
                          child: Text('Physics'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickPhysics),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickMath = _onButtonPressed(clickMath);
                          },
                          child: Text('Math'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMath),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickChemistry = _onButtonPressed(clickChemistry);
                          },
                          child: Text('Chemistry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickChemistry),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            clickEnglish = _onButtonPressed(clickEnglish);
                          },
                          child: Text('English'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickEnglish),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickBiology = _onButtonPressed(clickBiology);
                          },
                          child: Text('Biology'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickBiology),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickBangla = _onButtonPressed(clickBangla);
                          },
                          child: Text('Bangla'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickBangla),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickMale = _onButtonPressed(clickMale);
                          },
                          child: Text('Male'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMale),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickFemale = _onButtonPressed(clickFemale);
                          },
                          child: Text('Female'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickFemale),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Text(
                      'Experience',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            clickLessOne = _onButtonPressed(clickLessOne);
                          },
                          child: Text('<1year'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickLessOne),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickOneToThree = _onButtonPressed(clickOneToThree);
                          },
                          child: Text('1-3year'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickOneToThree),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickThreeToFive =
                                _onButtonPressed(clickThreeToFive);
                          },
                          child: Text('3-5 + year'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickThreeToFive),
                          ),
                        ),
                      ],
                    ),

                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    //----------------------------------------------------------//
                    Text(
                      'Salary Range ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click2k = _onButtonPressed(click2k);
                          },
                          child: Text('2k-3k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3k = _onButtonPressed(click3k);
                          },
                          child: Text('3k-5k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click3k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5k = _onButtonPressed(click5k);
                          },
                          child: Text('5k-7k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click5k),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click7k = _onButtonPressed(click7k);
                          },
                          child: Text('7k-9k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click7k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click10k = _onButtonPressed(click10k);
                          },
                          child: Text('10k+'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click10k),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Text(
                      'Ratings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click1s = _onButtonPressed(click1s);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1'),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click1s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click2s = _onButtonPressed(click2s);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2'),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3s = _onButtonPressed(click3s);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3'),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click3s),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click4s = _onButtonPressed(click4s);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4'),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click4s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5s = _onButtonPressed(click5s);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click5s),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5'),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Apply'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF00BFA5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
