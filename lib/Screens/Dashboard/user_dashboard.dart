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

class ClassScheduleTable extends StatelessWidget {
  final List<List<String>> timetable = [
    ['8:30 AM - 9:50 AM', '', '', '', '', ''],
    ['10:00 AM', '', '', '', '', ''],
    ['11:30 AM', '', '', '', '', ''],
    [' ', 'Lunch', 'Lunch', 'Lunch', 'Lunch', 'Lunch'],
    ['2:00 PM', '', '', '', '', ''],
    ['3:30 PM', '', '', '', '', ''],
  ];

  const TimeSlotTile({super.key, required this.time});

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
