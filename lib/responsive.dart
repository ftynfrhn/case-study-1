// NUR FATIN FARHANA BINTI HAMDAN (2014226)

import 'package:flutter/material.dart';

// Adapt the UI to different screen sizes
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  // constructor: initilize required and optional parameters
  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  // static helper methods: return true if the screen size fits the condition
  // check if the screen size is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 576; // MediaQuery is a class that provides information about the current media/device's screen

  // check if the screen size is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width < 992;

  // check if the screen size is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 992;

  // build method: return the appropriate widget based on the screen size (determined by static helper methods)
  @override // overridden from StatelessWidget class
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 992) {
      return desktop;
    } else if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}