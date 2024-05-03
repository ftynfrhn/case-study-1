import 'package:flutter/material.dart';

class Course {
  final String courseName;
  final String timing;
  final String date;
  final String lecturerName;

  Course({
    required this.courseName,
    required this.timing,
    required this.date,
    required this.lecturerName,
  });
}

class CourseSchedulePage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      courseName: 'Machine Learning',
      timing: '8:30 AM - 9:50 AM',
      date: 'Monday''Wednesday',
      lecturerName: 'Norlina Hamza',
    ),
    Course(
      courseName: 'Machine Learning',
      timing: '2:00 PM - 3:20 PM',
      date: 'Tuesday''Thursday',
      lecturerName: 'Norlina Hamza',
    ),
    Course(
      courseName: 'Machine Learning',
      timing: '11:30 AM - 12:50 PM',
      date: 'Monday''Wednesday',
      lecturerName: 'Norlina Hamza',
    ),
    Course(
      courseName: 'Big Data Analytics',
      timing: '10:00 AM - 11:20 PM',
      date: 'Monday''Wednesday',
      lecturerName: 'Razeen Ansari',
    ),
    Course(
      courseName: 'Natural Language Processing',
      timing: '3:30 PM - 4:50 PM',
      date: 'Monday''Wednesday',
      lecturerName: 'Alex Johnson',
    ),
    Course(
      courseName: 'Data Science',
      timing: '10:00 AM - 11:20 AM',
      date: 'Monday''Wednesday',
      lecturerName: 'Emily Brown',
    ),
    Course(
      courseName: 'Data Science',
      timing: '2:00 PM - 3:20 PM',
      date: 'Tuesday''Thursday',
      lecturerName: 'Emily Brown',
    ),
    Course(
      courseName: 'Natural Language Processing',
      timing: '9:00 AM - 10:20 AM',
      date: 'Monday''Wednesday',
      lecturerName: 'John Smith',
    ),
    Course(
      courseName: 'Bio-Inspired Computing',
      timing: '1:00 PM - 2:20 PM',
      date: 'Monday''Wednesday',
      lecturerName: 'Sarah Johnson',
    ),
    Course(
      courseName: 'Introduction to Affective Computing',
      timing: '11:30 AM - 12:50 PM',
      date: 'Tuesday''Thursday',
      lecturerName: 'Michael Williams',
    ),
    Course(
      courseName: 'Database Programming',
      timing: '4:00 PM - 5:20 PM',
      date: 'Tuesday''Thursday',
      lecturerName: 'Emma Davis',
    ),
    Course(
      courseName: 'Data Mining',
      timing: '8:30 AM - 9:50 AM',
      date: 'Tuesday''Thursday',
      lecturerName: 'David Miller',
    ),
  ];

  CourseSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Schedule'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.courseName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Timing: ${course.timing}'),
                Text('Date: ${course.date}'),
                Text('Lecturer: ${course.lecturerName}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp( MaterialApp(
    home: CourseSchedulePage()
  ));
}
