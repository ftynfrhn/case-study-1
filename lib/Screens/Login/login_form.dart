import 'package:flutter/material.dart';
import '../../constants.dart';
import '../Dashboard/admin_dashboard.dart';
import '../Dashboard/user_dashboard.dart';

// reusable widget representing the login form & provide navigation to the respective dashboard
class LoginForm extends StatelessWidget {
  final bool isAdmin;
  const LoginForm({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('isAdmin in LoginForm: $isAdmin');
    return Form( // Form - a container for form fields
      child: Column( // column arranges widgets vertically
        children: [
          TextFormField( // TextFormField - a text field that allows users to enter text
            keyboardType: TextInputType.emailAddress, // set the keyboard type to email
            textInputAction: TextInputAction.next, // tailor the keyboard action button
            onSaved: (email) {}, // callback function to save the email (! can be used to validate the email later)
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: defaultPadding), // add vertical space
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true, // hide the password text
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: defaultPadding * 3),
          ElevatedButton(
            onPressed: () { // specify action taken when the button is pressed
              if (isAdmin) {
                // login as admin -> navigate to admin dashboard
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => AdminDashboard()), // MaterialPageRoute - fullscreen route transition
                );
              } else {
                // login as user -> navigate to user dashboard
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => UserDashboard()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
