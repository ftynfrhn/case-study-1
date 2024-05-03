import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Class Schedule',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ClassScheduleTable(),
              // Add other widgets or sections of the user dashboard here
            ],
          ),
        ),
      ),
    );
  }
}

class ClassScheduleTable extends StatelessWidget {
  final List<List<String>> timetable = [
    ['8:30 AM - 9:50 AM', '', '', '', '', ''],
    ['10:00 AM', '', '', '', '', ''],
    ['11:30 AM', '', '', '', '', ''],
    [' ', 'Lunch', 'Lunch', 'Lunch', 'Lunch', 'Lunch'],
    ['2:00 PM', '', '', '', '', ''],
    ['3:30 PM', '', '', '', '', ''],
  ];

  void insertCourse(int dayIndex, String time, String courseCode) {
    int timeIndex = 0;
    switch (time) {
      case '8:30 AM - 9:50 AM':
        timeIndex = 1;
        break;
      case '10:00 AM':
        timeIndex = 2;
        break;
      case '11:30 AM':
        timeIndex = 3;
        break;
      case '2:00 PM':
        timeIndex = 4;
        break;
      case '3:30 PM':
        timeIndex = 5;
        break;
    }
    timetable[dayIndex][timeIndex] = courseCode;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('Monday')),
        DataColumn(label: Text('Tuesday')),
        DataColumn(label: Text('Wednesday')),
        DataColumn(label: Text('Thursday')),
        DataColumn(label: Text('Friday')),
      ],
      rows: List<DataRow>.generate(
        timetable.length,
        (index) => DataRow(
          cells: List<DataCell>.generate(
            timetable[index].length,
            (cellIndex) => DataCell(
              Text(timetable[index][cellIndex]),
            ),
          ),
        ),
      ),
    );
  }
}
