import 'package:flutter/material.dart';

// convenient way to create a background for the app
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // prevent keyboard from resizing the screen
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack( // overlay the background with the child widget
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(child: child), // avoid overlapping with the system status bar
          ],
        ),
      ),
    );
    }
  } 
