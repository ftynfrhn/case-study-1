import 'package:flutter/material.dart';

// Define the Course class to represent course information
class Course {
  final String courseCode;
  final String courseName;
  final String time;
  final String day;
  final String lecturerName;

  Course({
    required this.courseCode,
    required this.courseName,
    required this.time,
    required this.day,
    required this.lecturerName,
  });
}

// Define the CourseSchedulePage widget
class CourseSchedulePage extends StatelessWidget {
  // List of courses
  final List<Course> courses = [
    Course(
      courseCode: 'CSCI 4340',
      courseName: 'Machine Learning',
      time: '08:30 AM - 09:50 AM',
      day: 'Monday-Wednesday',
      lecturerName: 'Norlina Hamza',
    ),
    Course(
      courseCode: 'CSCI 4340',
      courseName: 'Machine Learning',
      time: '02:00 PM - 03:20 PM',
      day: 'Tuesday-Thursday',
      lecturerName: 'Norlina Hamza',
    ),
    Course(
      courseCode: 'CSCI 4401',
      courseName: 'Final Year Project I',
      time: '10:00 AM - 11:20 AM',
      day: 'Friday',
      lecturerName: 'Nurul Hidayah',
    ),
    Course(
      courseCode: 'CSCI 4402',
      courseName: 'Final Year Project II',
      time: '11:30 AM - 12:50 PM',
      day: 'Friday',
      lecturerName: 'Nurul Hidayah',
    ),
    Course(
      courseCode: 'CSCI 4341',
      courseName: 'Big Data Analytics',
      time: '10:00 AM - 11:20 AM',
      day: 'Monday-Wednesday',
      lecturerName: 'Razeen Ansari',
    ),
    Course(
      courseCode: 'CSCI 4342',
      courseName: 'Natural Language Processing',
      time: '03:30 PM - 04:50 PM',
      day: 'Monday-Wednesday',
      lecturerName: 'Alex Johnson',
    ),
    Course(
      courseCode: 'CSCI 4342',
      courseName: 'Natural Language Processing',
      time: '10:00 AM - 11:20 AM',
      day: 'Monday-Wednesday',
      lecturerName: 'John Smith',
    ),
    Course(
      courseCode: 'CSCI 4343',
      courseName: 'Data Science',
      time: '10:00 AM - 11:20 AM',
      day: 'Monday-Wednesday',
      lecturerName: 'Emily Brown',
    ),
    Course(
      courseCode: 'CSCI 4343',
      courseName: 'Data Science',
      time: '02:00 PM - 03:20 PM',
      day: 'Tuesday-Thursday',
      lecturerName: 'Emily Brown',
    ),
    Course(
      courseCode: 'CSCI 4346',
      courseName: 'Bio-Inspired Computing',
      time: '02:00 PM - 03:20 PM',
      day: 'Monday-Wednesday',
      lecturerName: 'Sarah Johnson',
    ),
    Course(
      courseCode: 'CSCI 4344',
      courseName: 'Introduction to Affective Computing',
      time: '11:30 AM - 12:50 PM',
      day: 'Tuesday-Thursday',
      lecturerName: 'Michael Williams',
    ),
    Course(
      courseCode: 'INFO 2303',
      courseName: 'Database Programming',
      time: '03:30 PM - 04:50 PM',
      day: 'Tuesday-Thursday',
      lecturerName: 'Emma Davis',
    ),
    Course(
      courseCode: 'INFO 4313',
      courseName: 'Data Mining',
      time: '08:30 AM - 09:50 AM',
      day: 'Tuesday-Thursday',
      lecturerName: 'David Miller',
    ),
  ];


  CourseSchedulePage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Schedule List'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView( // Ensure the content is scrollable
            child: DataTable( // Display course data in a DataTable
              columnSpacing: 20.0, // Set the spacing between columns
              columns: const [ // Define the columns
                DataColumn(label: Text('Course Code')),
                DataColumn(label: Text('Course Name')),
                DataColumn(label: Text('Timing')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Lecturer')),
              ],
              rows: courses.map((course) { // Map the course data to the DataRow widgets
                return DataRow(cells: [
                  DataCell(Text(course.courseCode)),
                  DataCell(Text(course.courseName)),
                  DataCell(Text(course.time)),
                  DataCell(Text(course.day)),
                  DataCell(Text(course.lecturerName)),
                ]);
              }).toList(), // Convert the mapped data to a list
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: CourseSchedulePage(),
//   ));
// }
