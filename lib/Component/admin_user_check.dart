import 'package:flutter/material.dart';
import '../../../constants.dart';

class AdminUserCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AdminUserCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Login as ",
          style: const TextStyle(color: kPrimaryColor), 
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Admin" : "User",
            style: const TextStyle(
              color: kPrimaryColor, 
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}