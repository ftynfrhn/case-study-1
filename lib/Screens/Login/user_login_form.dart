// NUR FATIN FARHANA BINTI HAMDAN (2014226)

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../Dashboard/user_dashboard.dart';

// Form widget for user login
class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email input field
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Your email',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: defaultPadding),
          // Password input field
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Your password',
              prefixIcon: Icon(Icons.lock),
            ),
            // Callback function called when the user submits the field
            onFieldSubmitted: (_) {
              _submitForm(context); // Call the function to submit the form
            },
          ),
          const SizedBox(height: defaultPadding * 3),
          // Login button
          ElevatedButton(
            onPressed: () {
              _submitForm(context); // Call the function to submit the form
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text("Login".toUpperCase()),
          ),
        ],
      ),
    );
  }

  // Function to handle form submission
  void _submitForm(BuildContext context) {
    String username = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      // Show error message if username or password is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: const Text('Please enter both email and password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(color: kPrimaryColor)),
              ),
            ],
          );
        },
      );
    } else if (username == 'user1@gmail.com' && password == 'user1' ||
        username == 'user2@gmail.com' && password == 'user2') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserDashboard()),
      );
    } else {
      // Show error message if login credentials are incorrect
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incorrect Login'),
            content: const Text('Email or password is incorrect.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(color: kPrimaryColor)),
              ),
            ],
          );
        },
      );
    }
  }
}