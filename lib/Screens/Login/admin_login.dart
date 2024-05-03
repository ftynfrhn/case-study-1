import 'package:flutter/material.dart';
import '../../Responsive.dart';
import '../../Component/background.dart';
import '../../../constants.dart';
import 'login_form.dart';
import 'user_login.dart'; // Import the AdminDashboard page

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = true; // Set isAdmin to true for admin login
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: MobileLoginScreen(isAdmin: isAdmin),
            desktop: DesktopLoginScreen(isAdmin: isAdmin),
          ),
        ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopText(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(isAdmin: isAdmin),
            ),
            const Spacer(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () {
              // Navigate to the UserLogin page when "Login As User" button is tapped
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
          child: LoginScreenTopText(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: LoginForm(isAdmin: isAdmin),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the UserLogin page when "Login As User" button is tapped
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

class LoginScreenTopText extends StatelessWidget {
  const LoginScreenTopText({
    super.key,
  });

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
