import 'package:flutter/material.dart';
import '../../constants.dart';
import '../Dashboard/user_dashboard.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isAdmin;

  LoginForm({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Your email',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Your password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: defaultPadding * 3),
          ElevatedButton(
            onPressed: () {
              String username = usernameController.text.trim();
              String password = passwordController.text.trim();

              if (username.isEmpty || password.isEmpty) {
                // Show error message if username or password is empty
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Missing Information'),
                      content: Text('Please enter both email and password.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
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
                      title: Text('Incorrect Login'),
                      content: Text('Email or password is incorrect.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
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
}
