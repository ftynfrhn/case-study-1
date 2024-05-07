// BALQIS HAIFA BINTI M.NASER (2026210)

import 'package:flutter/material.dart';

class User {
  final String name;

  User({required this.name});
}

class Course {
  final String courseName;
  final String day;
  final String timeSlot;
  final String userName;

  Course({
    required this.courseName,
    required this.day,
    required this.timeSlot,
    required this.userName,
  });
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<User> users = [
    User(name: 'Saleem el-Habib'),
    User(name: 'Nafeesa Abdullah'),
    User(name: 'Naasiruddeen Samra'),
    User(name: 'Khadeeja alali'),
  ];

  List<Course> courses = [
    Course(courseName: 'Data Science', day: 'Monday', timeSlot: '8:30 AM - 9:50 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Data Science', day: 'Wednesday', timeSlot: '8:30 AM - 9:50 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Database Programming', day: 'Tuesday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Database Programming', day: 'Thursday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Machine Learning', day: 'Wednesday', timeSlot: '11:30 AM - 12:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Machine Learning', day: 'Monday', timeSlot: '11:30 AM - 12:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Introduction to Affective Computing', day: 'Tuesday', timeSlot: '11:30 AM - 12:50 PM', userName: 'Khadeeja alali'),
    Course(courseName: 'Introduction to Affective Computing', day: 'Thursday', timeSlot: '11:30 AM - 12:50 PM', userName: 'Khadeeja alali'),
    Course(courseName: 'Machine Learning', day: 'Monday', timeSlot: '2:00 PM - 2:20 PM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Machine Learning', day: 'Wednesday', timeSlot: '2:00 PM - 2:20 PM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Big Data Analytics', day: 'Tuesday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Big Data Analytics', day: 'Thursday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Data Mining', day: 'Monday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Khadeeja alali'),
    Course(courseName: 'Data Mining', day: 'Wednesday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Khadeeja alali'),
    Course(courseName: 'Natural Language Processing', day: 'Tuesday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Natural Language Processing', day: 'Thursday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Bio-Inspired Computing', day: 'Monday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Bio-Inspired Computing', day: 'Wednesday', timeSlot: '10:00 AM - 11:20 AM', userName: 'Saleem el-Habib'),
    Course(courseName: 'Cryptography', day: 'Monday', timeSlot: '11:30 AM - 12.50 PM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Cryptography', day: 'Wednesday', timeSlot: '11:30 AM - 12.50 PM', userName: 'Nafeesa Abdullah'),
    Course(courseName: 'Data Science', day: 'Wednesday', timeSlot: '9:00 AM - 10:20 AM', userName: 'Naasiruddeen Samra'),    
    Course(courseName: 'Data Science', day: 'Monday', timeSlot: '9:00 AM - 10:20 AM', userName: 'Naasiruddeen Samra'),    
    Course(courseName: 'Data Mining', day: 'Wednesday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Data Mining', day: 'Monday', timeSlot: '3:30 PM - 4:50 PM', userName: 'Naasiruddeen Samra'),
    Course(courseName: 'Cryptography', day: 'Tuesday', timeSlot: '8:30 AM - 9:50 AM', userName: 'Khadeeja alali'),
    Course(courseName: 'Cryptography', day: 'Thursday', timeSlot: '8:30 AM - 9:50 AM', userName: 'Khadeeja alali'),
  ];

  User? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select a User:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Users')),
                  ],
                  rows: _buildUserRows(),
                ),
              ),
            ),
            if (selectedUser != null) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Class for ${selectedUser!.name}:',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Monday')),
                      DataColumn(label: Text('Tuesday')),
                      DataColumn(label: Text('Wednesday')),
                      DataColumn(label: Text('Thursday')),
                      DataColumn(label: Text('Friday')),
                    ],
                    rows: _buildCourseRows(selectedUser!),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<DataRow> _buildUserRows() {
    return users.map((user) {
      return DataRow(
        cells: [
          DataCell(
            Text(user.name),
            onTap: () {
              setState(() {
                selectedUser = user;
              });
            },
          ),
        ],
      );
    }).toList();
  }

  List<DataRow> _buildCourseRows(User user) {
    List<DataRow> rows = [];

    List<Course> userCourses = courses.where((course) => course.userName == user.name).toList();

    // Initialize a map to store courses for each day
    Map<String, List<Course>> coursesByDay = {
      'Monday': [],
      'Tuesday': [],
      'Wednesday': [],
      'Thursday': [],
      'Friday': [],
    };

    // Group courses by day
    for (var course in userCourses) {
      if (course.day.isNotEmpty && coursesByDay.containsKey(course.day)) {
        coursesByDay[course.day]!.add(course);
      }
    }

    // Sort courses by time slot
    for (var day in coursesByDay.keys) {
      coursesByDay[day]!.sort((a, b) => a.timeSlot.compareTo(b.timeSlot));
    }

    // Build rows for each time slot
    List<String> timeSlots = userCourses.map((course) => course.timeSlot).toSet().toList();
    timeSlots.sort();
    for (var timeSlot in timeSlots) {
      List<DataCell> cells = [DataCell(Text(timeSlot))];

      for (var day in coursesByDay.keys) {
        List<Course> dayCourses = coursesByDay[day]!;
        Course? course = dayCourses.firstWhere((c) => c.timeSlot == timeSlot, orElse: () => Course(courseName: '', day: '', timeSlot: '', userName: ''));
        cells.add(DataCell(Text(course.courseName)));
      }

      rows.add(DataRow(cells: cells));
    }

    return rows;
  }
}

void main() {
  runApp(const MaterialApp(
    home: AdminDashboard(),
  ));
}
