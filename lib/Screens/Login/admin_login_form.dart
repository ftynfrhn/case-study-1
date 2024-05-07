import 'package:flutter/material.dart';
import '../Dashboard/admin_dashboard.dart';

class AdminLoginForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ignore: avoid_types_as_parameter_names
  AdminLoginForm({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure children stretch horizontally
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 16), // Add space between the fields
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16), // Add space between the fields and the button
          ElevatedButton(
            onPressed: () {
              String username = usernameController.text.trim();
              String password = passwordController.text.trim();
              if (username == 'admin' && password == '1234') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboard()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Incorrect Login'),
                      content: const Text('Username or password is incorrect.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Set the button background color to green
              padding: const EdgeInsets.symmetric(vertical: 16), // Add vertical padding
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
