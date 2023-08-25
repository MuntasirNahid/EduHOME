import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_ux/constants/filter_object_student.dart';

class StudentMyDrawer extends StatefulWidget {
  final Function onDataSelected;
  final Function applyFilters;
  final Function clearFilters;

  StudentMyDrawer({
    required this.onDataSelected,
    required this.applyFilters,
    required this.clearFilters,
  });

  @override
  State<StudentMyDrawer> createState() => _StudentMyDrawerState();
}

class _StudentMyDrawerState extends State<StudentMyDrawer> {
  int clickPhysics = 0,
      clickMath = 0,
      clickChemistry = 0,
      clickEnglish = 0,
      clickBiology = 0,
      clickIct = 0,
      clickMale = 0,
      clickFemale = 0,
      click2k = 0,
      click3k = 0,
      click7k = 0,
      click5k = 0,
      click10k = 0,
      click20k = 0,
      click1s = 0,
      click2s = 0,
      click3s = 0,
      click4s = 0,
      click5s = 0;

  String location = "";

  FilterObjectStudent filterObjectStudent = FilterObjectStudent();

  // Color buttonColor = Colors.grey;

  int _onButtonPressed(int clickCount) {
    return clickCount == 0 ? 1 : 0;
    // int clickCounter = clickCount;
    // setState(
    //   () {
    //     if (clickCounter == 0)
    //       clickCounter = 1;
    //     else
    //       clickCounter = 0;
    //   },
    // );
    // return clickCounter;
  }

  Color getButtonColor(int clickCount) {
    return clickCount % 2 == 0 ? Colors.grey : Color(0xFF00BFA5);
  }

  void clearFilters() {
    setState(() {
      clickPhysics = 0;
      clickMath = 0;
      clickChemistry = 0;
      clickEnglish = 0;
      clickBiology = 0;
      clickIct = 0;
      clickMale = 0;
      clickFemale = 0;
      click2k = 0;
      click3k = 0;
      click7k = 0;
      click5k = 0;
      click10k = 0;
      click20k = 0;
      click1s = 0;
      click2s = 0;
      click3s = 0;
      click4s = 0;
      click5s = 0;

      location = "";
      filterObjectStudent = FilterObjectStudent();
    });

    widget.onDataSelected(filterObjectStudent);
  }

  void applyFilters() {
    // Apply the filters and pass the filtered list to the onDataSelected callback
    widget.onDataSelected(filterObjectStudent);
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
                  widget.clearFilters();
                  //  Navigator.pop(context);
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
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickPhysics == 1) {
                                filterObjectStudent.teachingSubject += "Phy,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Phy,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Physics'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickPhysics),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickMath = _onButtonPressed(clickMath);
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickMath == 1) {
                                filterObjectStudent.teachingSubject += "Math,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Math,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Math'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMath),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickChemistry = _onButtonPressed(clickChemistry);
                            setState(() {
                              if (clickChemistry == 1) {
                                filterObjectStudent.teachingSubject += "Chem,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Chem,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
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
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickEnglish == 1) {
                                filterObjectStudent.teachingSubject += "Eng,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Eng,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('English'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickEnglish),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickBiology = _onButtonPressed(clickBiology);
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickBiology == 1) {
                                filterObjectStudent.teachingSubject += "Bio,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Bio,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Biology'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickBiology),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickIct = _onButtonPressed(clickIct);
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickIct == 1) {
                                filterObjectStudent.teachingSubject += "Ict,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Ict,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('ICT'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickIct),
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
                            if (clickMale == 1) {
                              filterObjectStudent.gender = "Male";
                            } else {
                              filterObjectStudent.gender = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Male'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMale),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickFemale = _onButtonPressed(clickFemale);
                            if (clickFemale == 1) {
                              filterObjectStudent.gender = "Female";
                            } else {
                              filterObjectStudent.gender = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            location = value;
                          });

                          filterObjectStudent.location = location;
                          widget.onDataSelected(filterObjectStudent);
                        },
                        decoration: InputDecoration(
                          labelText: 'Location',
                          hintText: 'Enter your preferred location',
                        ),
                      ),
                    ),

                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    //----------------------------------------------------------//
                    Text(
                      'Max Salary Range ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click2k = _onButtonPressed(click2k);
                            if (click2k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "3000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('3k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3k = _onButtonPressed(click3k);
                            if (click3k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "5000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('5k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click3k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5k = _onButtonPressed(click5k);
                            if (click5k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "7000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('7k'),
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
                            if (click7k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "9000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('9k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click7k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click10k = _onButtonPressed(click10k);
                            if (click10k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "10000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('10k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click10k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click20k = _onButtonPressed(click20k);
                            if (click20k == 1) {
                              filterObjectStudent.minSalary = "0";
                              filterObjectStudent.maxSalary = "20000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('20k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click10k),
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
