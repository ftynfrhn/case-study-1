import 'package:case_study1/Screens/Login/user_login.dart';
import 'package:flutter/material.dart';
import '../../Responsive.dart';
import '../../Component/background.dart';
import '../../../constants.dart';
import 'login_form.dart';

// set admin login screen layout & provide navigation to admin login screen
class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = false;
    //print('isAdmin in UserLogin: $isAdmin');
    return Background(
      child: SingleChildScrollView( // ensures contain scrollable
        child: SafeArea(
          child: Responsive(
          mobile: MobileLoginScreen(isAdmin: isAdmin),
          desktop: DesktopLoginScreen(isAdmin: isAdmin),
        ),
        )
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  final bool isAdmin;
  const MobileLoginScreen({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('isAdmin in MobileLoginScreen: $isAdmin');
    return Column( // arrange children vertically
      mainAxisAlignment: MainAxisAlignment.center, // vertically centered
      children: <Widget>[
        const LoginScreenTopText(),
        Row( // arrange children horizontally
          children: [
            const Spacer(), // add flexible space (left side)
            Expanded( // fill the remaining space
              flex: 8, // 80% of the screen width
              child: LoginForm(isAdmin: isAdmin),
            ),
            const Spacer(), // add flexible space (right side)
          ],
         ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0), // Add only top padding
          // navigate to admin login screen when clicked on the text
          child: GestureDetector(
            onTap: () { // specify action taken when the text is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminLogin()),
              );
            },
            child: const Text(
              "Login As User",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopLoginScreen extends StatelessWidget {
  final bool isAdmin;
  const DesktopLoginScreen({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('isAdmin in DesktopLoginScreen: $isAdmin');
    return Row( // arrange children horizontally
      mainAxisAlignment: MainAxisAlignment.end, // align children to the right
      children: [
        const Expanded(
          child: LoginScreenTopText(),
        ),
        Expanded(
          child: Column( // arrange children vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450, // set the width of the login form
                child: LoginForm(isAdmin: isAdmin),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Add only top padding
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserLogin()),
                    );
                  },
                  child: const Text(
                    "Login As User",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Top text of the login screen
class LoginScreenTopText extends StatelessWidget {
  const LoginScreenTopText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "ADMIN LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        SizedBox(height: defaultPadding * 4),
      ],
    );
  }
}
