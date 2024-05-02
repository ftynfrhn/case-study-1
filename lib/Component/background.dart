import 'package:flutter/material.dart';

// convenient way to create a background for the app 
// and ensures the background properly adjusted to the screen size
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  // build method builds the widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // prevent keyboard from resizing the screen
      body: SizedBox( // SizedBox - a box with a specified size, body - main content of the screen
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack( // stack - overlay the background with the child widget
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(child: child), // avoid overlapping with the system status bar
          ],
        ),
      ),
    );
    }
  } 
