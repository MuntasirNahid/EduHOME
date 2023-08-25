import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_ux/constants/filter_object.dart';

class MyDrawer extends StatefulWidget {
  final Function onDataSelected;
  final Function applyFilters;
  final Function clearFilters;

  MyDrawer({
    required this.onDataSelected,
    required this.applyFilters,
    required this.clearFilters,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
      click1s = 0,
      click2s = 0,
      click3s = 0,
      click4s = 0,
      click5s = 0;

  String location = "";

  FilterObject filterObject = FilterObject();

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
      click1s = 0;
      click2s = 0;
      click3s = 0;
      click4s = 0;
      click5s = 0;

      location = "";
      filterObject = FilterObject();
    });

    widget.onDataSelected(filterObject);
  }

  void applyFilters() {
    // Apply the filters and pass the filtered list to the onDataSelected callback
    widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Phy,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Phy,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Math,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Math,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Chem,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Chem,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Eng,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Eng,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Bio,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Bio,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                                filterObject.subjects += "Ict,";
                              } else {
                                filterObject.subjects = filterObject.subjects
                                    .replaceAll("Ict,", "");
                              }
                            });
                            widget.onDataSelected(filterObject);
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
                              filterObject.teacherGender = "Male";
                            } else {
                              filterObject.teacherGender = "";
                            }
                            widget.onDataSelected(filterObject);
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
                              filterObject.teacherGender = "Female";
                            } else {
                              filterObject.teacherGender = "";
                            }
                            widget.onDataSelected(filterObject);
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

                          filterObject.location = location;
                          widget.onDataSelected(filterObject);
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
                            if (click2k == 1) {
                              filterObject.minSalary = "2000";
                              filterObject.maxSalary = "3000";
                            } else {
                              filterObject.minSalary = "";
                              filterObject.maxSalary = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Text('2k-3k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3k = _onButtonPressed(click3k);
                            if (click3k == 1) {
                              filterObject.minSalary = "3000";
                              filterObject.maxSalary = "5000";
                            } else {
                              filterObject.minSalary = "";
                              filterObject.maxSalary = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Text('3k-5k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click3k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5k = _onButtonPressed(click5k);
                            if (click5k == 1) {
                              filterObject.minSalary = "5000";
                              filterObject.maxSalary = "7000";
                            } else {
                              filterObject.minSalary = "";
                              filterObject.maxSalary = "";
                            }
                            widget.onDataSelected(filterObject);
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
                            if (click7k == 1) {
                              filterObject.minSalary = "7000";
                              filterObject.maxSalary = "9000";
                            } else {
                              filterObject.minSalary = "";
                              filterObject.maxSalary = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Text('7k-9k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click7k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click10k = _onButtonPressed(click10k);
                            if (click10k == 1) {
                              filterObject.minSalary = "10000";
                              filterObject.maxSalary = "30000";
                            } else {
                              filterObject.minSalary = "";
                              filterObject.maxSalary = "";
                            }
                            widget.onDataSelected(filterObject);
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
                      'Days In Week',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click1s = _onButtonPressed(click1s);
                            if (click1s == 1) {
                              filterObject.daysInWeek = "1";
                            } else {
                              filterObject.daysInWeek = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1'),
                              SizedBox(width: 5),
                              //Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click1s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click2s = _onButtonPressed(click2s);

                            if (click2s == 1) {
                              filterObject.daysInWeek = "2";
                            } else {
                              filterObject.daysInWeek = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2'),
                              SizedBox(width: 5),
                              //Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3s = _onButtonPressed(click3s);
                            if (click3s == 1) {
                              filterObject.daysInWeek = "3";
                            } else {
                              filterObject.daysInWeek = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3'),
                              SizedBox(width: 5),
                              //  Icon(Icons.star, color: Colors.yellow),
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
                            if (click4s == 1) {
                              filterObject.daysInWeek = "4";
                            } else {
                              filterObject.daysInWeek = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4'),
                              SizedBox(width: 5),
                              //    Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click4s),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5s = _onButtonPressed(click5s);
                            if (click5s == 1) {
                              filterObject.daysInWeek = "5";
                            } else {
                              filterObject.daysInWeek = "";
                            }
                            widget.onDataSelected(filterObject);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click5s),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5'),
                              SizedBox(width: 5),
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
