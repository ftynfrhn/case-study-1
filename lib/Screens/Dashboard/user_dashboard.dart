import 'package:flutter/material.dart';
import 'course_schedule_page.dart'; 

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
      ),
      body: Column(
        children: [
          const Text(
            'Class Timetable',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of days (Monday to Friday)
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Day ${index + 1}'),
                  subtitle: const Column(
                    children: [
                      TimeSlotTile(time: '8:30 AM - 9:50 AM'),
                      TimeSlotTile(time: '10:00 AM - 11:20 AM'),
                      TimeSlotTile(time: '11:30 AM - 12:50 PM'),
                      TimeSlotTile(time: '2:00 PM - 3:20 PM'),
                      TimeSlotTile(time: '3:30 PM - 4:50 PM'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the CourseSchedulePage when the FAB is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CourseSchedulePage()),
          );
        },
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}

class TimeSlotTile extends StatelessWidget {
  final String time;

  const TimeSlotTile({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(time),
    );
  }
}