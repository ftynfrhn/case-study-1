import 'package:flutter/material.dart';
import '../../Responsive.dart';

import '../../Component/background.dart';
import '../../../constants.dart';
import 'login_form.dart';
import 'admin_login.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAdmin = false;
    print('isAdmin in UserLogin: $isAdmin');
    return Background(
      child: SingleChildScrollView(
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
    print('isAdmin in MobileLoginScreen: $isAdmin');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(isAdmin: isAdmin),
            ),
            Spacer(),
          ],
         ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0), // Add padding top
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLogin()),
              );
            },
            child: Text(
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
  final bool isAdmin;
  const DesktopLoginScreen({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('isAdmin in DesktopLoginScreen: $isAdmin');
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: LoginScreenTopImage(),
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
                padding: const EdgeInsets.only(top: 20.0), // Add padding top
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminLogin()),
                    );
                  },
                  child: Text(
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


class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
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