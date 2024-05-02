import 'package:flutter/material.dart';
import 'package:case_study1/constants.dart';
import 'package:case_study1/Screens/Login/user_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // configures the app's theme, title, and home screen
    return MaterialApp(
      title: 'Course Scheduling System',
      debugShowCheckedModeBanner: false, // hide the debug banner
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white, // text color
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(), // rounded rectangle button
            maximumSize: const Size(double.infinity, 56), // button width and height
            minimumSize: const Size(double.infinity, 56), // double.infinity - the button takes the full width of the screen
          ),  
        ) 
      ),
      home: const UserLogin(), // set the home screen
    );
  }
}
