import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:flutter/material.dart';

Widget fieldtext(String childtext) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(childtext,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 2,
            color: blackback)),
  );
}

Widget navigatedtextbutton(
  BuildContext context,
  childtext,
  Widget screen,
) {
  return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => screen));
      },
      child: Text(childtext));
}

const user =
    'https://as1.ftcdn.net/v2/jpg/03/39/45/96/1000_F_339459697_XAFacNQmwnvJRqe1Fe9VOptPWMUxlZP8.jpg';
