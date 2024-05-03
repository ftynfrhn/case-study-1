import 'package:flutter/material.dart';

class User {
  final String name;

  User({required this.name});
}

class Course {
  final String courseName;
  final String day;
  final String timeSlot;

  Course({required this.courseName, required this.day, required this.timeSlot});
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    Course(courseName: 'Machine Learning', day: 'Monday', timeSlot: '8:30 AM - 9:50 AM'),
    Course(courseName: 'Course B', day: 'Tuesday', timeSlot: '10:00 AM - 11:20 AM'),
    Course(courseName: 'Machine Learning', day: 'Wednesday', timeSlot: '11:30 AM - 12:50 PM'),
    Course(courseName: 'Introduction to Affective Computing', day: 'Thursday', timeSlot: '11:30 AM - 12:50 PM'),
    Course(courseName: '', day: 'Friday', timeSlot: '2:00 PM - 3:20 PM'),
    Course(courseName: 'Course F', day: 'Monday', timeSlot: '2:00 PM - 2:20 PM'),
    Course(courseName: 'Course G', day: 'Tuesday', timeSlot: '3:30 PM - 4:50 PM'),
    Course(courseName: 'Course H', day: 'Wednesday', timeSlot: '3:30 PM - 4:50 PM'),
    Course(courseName: 'Course I', day: 'Thursday', timeSlot: '10:00 AM - 11:20 AM'),
    Course(courseName: '', day: 'Friday', timeSlot: '10:00 AM - 11:20 AM'),
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
                'Select a user:',
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

    // Initialize a map to store courses for each day
    Map<String, List<Course>> coursesByDay = {
      'Monday': [],
      'Tuesday': [],
      'Wednesday': [],
      'Thursday': [],
      'Friday': [],
    };

    // Group courses by day
    for (var course in courses) {
      if (course.day.isNotEmpty && coursesByDay.containsKey(course.day)) {
        coursesByDay[course.day]!.add(course);
      }
    }

    // Sort courses by time slot
    for (var day in coursesByDay.keys) {
      coursesByDay[day]!.sort((a, b) => a.timeSlot.compareTo(b.timeSlot));
    }

    // Build rows for each time slot
    List<String> timeSlots = courses.map((course) => course.timeSlot).toSet().toList();
    timeSlots.sort();
    for (var timeSlot in timeSlots) {
      List<DataCell> cells = [DataCell(Text(timeSlot))];

      for (var day in coursesByDay.keys) {
        List<Course> dayCourses = coursesByDay[day]!;
        Course? course = dayCourses.firstWhere((c) => c.timeSlot == timeSlot, orElse: () => Course(courseName: '', day: '', timeSlot: ''));
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
