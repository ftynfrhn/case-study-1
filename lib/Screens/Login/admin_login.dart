import 'package:flutter/material.dart';

import '../../Component/background.dart';
import '../../../constants.dart';
import '../../Responsive.dart';
import 'LoginForm.dart';

// ana roughly create ni sebab nak avoid error, edit la 
class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        // child: Responsive(
        //   mobile: MobileLoginScreen(),
        //   desktop: DesktopLoginScreen(),
        // ),
      ),
    );
  }
}