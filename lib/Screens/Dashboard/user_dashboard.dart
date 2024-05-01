import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Column(
        children: [
          Text(
            'Class Timetable',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of days (Monday to Friday)
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Day ${index + 1}'),
                  subtitle: Column(
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
    );
  }
}

class TimeSlotTile extends StatelessWidget {
  final String time;

  const TimeSlotTile({required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(time),
    );
  }
}