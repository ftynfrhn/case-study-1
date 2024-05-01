import 'package:flutter/material.dart';

import '../../Component/admin_user_check.dart';
import '../../constants.dart';
import 'admin_login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSaved: (email) {}, // save the email
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: defaultPadding * 3),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2,
                vertical: defaultPadding,
              ),
            ),
            child: Text("Login".toUpperCase(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          AdminUserCheck(
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const AdminLogin();
                })
              );
          })
        ],
      ),
    );
  }
}
