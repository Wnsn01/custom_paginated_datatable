// Import necessary packages
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:custom_paginated_datatable/base_widget/field_text.dart';
import 'package:custom_paginated_datatable/base_widget/paginated_data_table.dart';
import 'package:custom_paginated_datatable/data_source.dart'; // DataSource class is in another file
import 'package:faker/faker.dart';

void main() {
  runApp(const MyApp());
}

// Custom scroll behavior class allowing gesture drag to scroll
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Paginated DataTable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final faker = Faker();
  List<Map<String, dynamic>> oriStudentList = [];
  List<Map<String, dynamic>> studentListResult = [];
  int _rowsPerPage = 10;
  TextEditingController studNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController joinedDateController = TextEditingController();
  final GlobalKey<FormFieldState> _dropdownKey = GlobalKey();
  List genderList = ['Male', 'Female'];

  // Function to randomly assign gender
  String _randomGender() {
    Random random = Random();
    return random.nextBool() ? 'Male' : 'Female';
  }

  // Function to generate a random date
  String _randomDate() {
    DateTime startDate = DateTime(2024, 1, 1);
    DateTime endDate = DateTime(2024, 1, 16);
    Duration difference = endDate.difference(startDate);
    Duration randomDuration = Duration(days: Random().nextInt(difference.inDays));
    DateTime randomDate = startDate.add(randomDuration);
    return DateFormat('dd-MM-yyyy').format(randomDate);
  }

  @override
  void initState() {
    // Initialize the list with dummy data
    for (int i = 0; i < 100; i++) {
      oriStudentList.add({
        "student_no": faker.randomGenerator.integer(999, min: 000),
        "name": faker.person.name(),
        "gender": _randomGender(),
        "age": faker.randomGenerator.integer(25, min: 18),
        "joined_date": _randomDate(),
        "selected": false
      });
      studentListResult = oriStudentList.toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomPaginatedDataTable(
            // Configurations for the PaginatedDataTable widget
            availableRowsPerPage: [10, 20, 50, 75, studentListResult.length],
            rowsPerPageTitle: 'Students Count',
            onRowsPerPageChanged: (val) {
              setState(() {
                _rowsPerPage = val ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            columnSpacing: 20,
            showCheckboxColumn: true,
            columns: <DataColumn>[
              DataColumn(
                label: SizedBox(
                  height: 50, width: 150,
                  child: TextFormField(
                    controller: studNoController,
                    decoration: searchHeader(
                      labelText: 'Student No.',
                      suffixIcon: IconButton(
                        onPressed: () {
                          studNoController.text = '';
                          setState(() {
                            studentListResult = searchData(
                              studNoController.text,
                              nameController.text,
                              genderController.text,
                              ageController.text,
                              joinedDateController.text,
                              oriStudentList);
                          });
                        },
                        icon: const Icon(Icons.close)
                      )
                    ),
                    onFieldSubmitted: (val) {
                      setState(() {
                        studentListResult = searchData(
                            studNoController.text,
                            nameController.text,
                            genderController.text,
                            ageController.text,
                            joinedDateController.text,
                            oriStudentList);
                      });
                    },
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  height: 50, width: 150,
                  child: TextFormField(
                    controller: nameController,
                    decoration: searchHeader(
                      labelText: 'Name',
                      suffixIcon: IconButton(
                        onPressed: () {
                          nameController.text = '';
                          setState(() {
                            studentListResult = searchData(
                                studNoController.text,
                                nameController.text,
                                genderController.text,
                                ageController.text,
                                joinedDateController.text,
                                oriStudentList);
                          });
                        },
                        icon: const Icon(Icons.close)
                      )
                    ),
                    onFieldSubmitted: (val) {
                      setState(() {
                        studentListResult = searchData(
                          studNoController.text,
                          nameController.text,
                          genderController.text,
                          ageController.text,
                          joinedDateController.text,
                          oriStudentList);
                      });
                    },
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  height: 50, width: 150,
                  child: DropdownButtonFormField<String>(
                    key: _dropdownKey,
                    items: genderList.map<DropdownMenuItem<String>>((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _dropdownKey.currentState!.reset();
                          genderController.text = '';
                          setState(() {
                            studentListResult = searchData(
                              studNoController.text,
                              nameController.text,
                              genderController.text,
                              ageController.text,
                              joinedDateController.text,
                              oriStudentList);
                          });
                        },
                      icon: const Icon(Icons.close)),
                      label: const Text('Gender'),
                      labelStyle: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                      border: const OutlineInputBorder(
                        borderRadius:
                          BorderRadius.all(Radius.circular(4)))),
                    onChanged: (String? e) {
                      genderController.text = e ?? '';
                      setState(() {
                        studentListResult = searchData(
                          studNoController.text,
                          nameController.text,
                          genderController.text,
                          ageController.text,
                          joinedDateController.text,
                          oriStudentList);
                      });
                    },
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  height: 50, width: 150,
                  child: TextFormField(
                    controller: ageController,
                    decoration: searchHeader(
                      labelText: 'Age',
                      suffixIcon: IconButton(
                        onPressed: () {
                          ageController.text = '';
                          setState(() {
                            studentListResult = searchData(
                              studNoController.text,
                              nameController.text,
                              genderController.text,
                              ageController.text,
                              joinedDateController.text,
                              oriStudentList);
                          });
                        },
                        icon: const Icon(Icons.close)
                      )
                    ),
                    onFieldSubmitted: (val) {
                      setState(() {
                        studentListResult = searchData(
                          studNoController.text,
                          nameController.text,
                          genderController.text,
                          ageController.text,
                          joinedDateController.text,
                          oriStudentList);
                      });
                    },
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  height: 55, width: 150,
                  child: TextFormField(
                    readOnly: true,
                    controller: joinedDateController,
                    decoration: InputDecoration(
                      labelText: 'Joined Date',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          joinedDateController.clear();
                        })),
                    onTap: () async {
                      DateTimeRange? newRange = await showDateRangePicker(
                        context: context,
                        builder: (context, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 400.0,
                                  maxHeight: MediaQuery.of(context)
                                    .size.height) / 1.1,
                                child: child,
                              )
                            ],
                          );
                        },
                        initialDateRange: DateTimeRange(
                            start: DateTime.now(), end: DateTime.now()),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (newRange == null) return;
                      joinedDateController.text =
                        '${DateFormat('dd-MM-yyyy').format(newRange.start)} - ${DateFormat('dd-MM-yyyy').format(newRange.end)}';
                      setState(() {
                        studentListResult = searchData(
                          studNoController.text,
                          nameController.text,
                          genderController.text,
                          ageController.text,
                          joinedDateController.text,
                          oriStudentList);
                      });
                    },
                  ),
                ),
              ),
            ],
            source: DataSource(
              entries: studentListResult,
              context: context,
            ),
            onSelectAll: (select) {
              setState(() {
                studentListResult.forEach((element) {
                  element['selected'] = select;
                });
              });
            },
            onPageChanged: (page) {},
            headingRowColor: MaterialStateProperty.resolveWith((states) {
              return Colors.grey.shade400;
            }),
            headingRowHeight: 65,
          ),
        ),
      ),
    );
  }
}

// Function to filter data based on search criteria
List<Map<String, dynamic>> searchData(String studNo, String name, String gender, String age, String joinedDate,
    List<Map<String, dynamic>> oriStudentList) {
  final temp = (studNo.isNotEmpty || name.isNotEmpty || gender.isNotEmpty || age.isNotEmpty || joinedDate.isNotEmpty)
      ? oriStudentList.where((element) {
          bool matchStudNo = studNo.isEmpty || element['student_no'].toString().contains(studNo);
          bool matchName = name.isEmpty || element['name'].toString().toLowerCase().contains(name.toLowerCase());
          bool matchGender = gender.isEmpty || element['gender'].toString().toLowerCase() == gender.toLowerCase();
          bool matchAge = age.isEmpty || element['age'].toString().contains(age);
          List<String> splitDate = joinedDate.split('-');
          bool matchJoinedDate = joinedDate.isEmpty ||
              DateTime.parse(element['joined_date']).year >= int.parse(splitDate[0]) &&
              DateTime.parse(element['joined_date']).year <= int.parse(splitDate[1]);

          return matchStudNo && matchName && matchGender && matchAge && matchJoinedDate;
        }).toList()
      : oriStudentList;
  return temp;
}
