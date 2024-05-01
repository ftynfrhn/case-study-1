import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Dashboard/admin_dashboard.dart';
import '../Dashboard/user_dashboard.dart';

class LoginForm extends StatelessWidget {
  final bool isAdmin;
  const LoginForm({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('isAdmin in LoginForm: $isAdmin');
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
            onPressed: () {
              if (isAdmin) {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => AdminDashboard()),
                );
              } else {
                // login as user
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => UserDashboard()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2,
                vertical: defaultPadding,
              ),
            ),
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
