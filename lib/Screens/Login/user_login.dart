// NUR FATIN FARHANA BINTI HAMDAN (2014226)

import 'package:flutter/material.dart';
import '../../Responsive.dart';
import '../../Component/background.dart';
import '../../../constants.dart';
import 'user_login_form.dart';
import 'admin_login.dart';

// set user login screen layout & provide navigation to admin login screen
class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView( // ensures contain scrollable
        child: SafeArea(
          child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: DesktopLoginScreen(),
        ),
        )
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {

  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( // arrange children vertically
      mainAxisAlignment: MainAxisAlignment.center, // vertically centered
      children: <Widget>[
        const LoginScreenTopText(),
        Row( // arrange children horizontally
          children: [
            const Spacer(), // add flexible space (left side)
            Expanded( // fill the remaining space
              flex: 8, // 80% of the screen width
              child: LoginForm(),
            ),
            const Spacer(), // add flexible space (right side)
          ],
         ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0), // Add only top padding
          // navigate to admin login screen when clicked on the text
          child: GestureDetector(
            onTap: () => _navigateToAdminLogin(context),
            child: const Text(
              "Login As Admin",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopLoginScreen extends StatelessWidget {
  
  const DesktopLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: LoginForm(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Add only top padding
                child: GestureDetector(
                  onTap: () => _navigateToAdminLogin(context), 
                  child: const Text(
                    "Login As Admin",
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

// function for navigating to the admin login screen
void _navigateToAdminLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AdminLogin()),
  );
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
          "USER LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        SizedBox(height: defaultPadding * 4),
      ],
    );
  }
}
