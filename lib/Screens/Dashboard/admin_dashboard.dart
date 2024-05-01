import 'package:flutter/material.dart';
import '../../Component/background.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        // child: Responsive(
        //   mobile: MobileLoginScreen(isAdmin: true),
        //   desktop: DesktopLoginScreen(isAdmin: true),
        // ),
      ),
    );
  }
}