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
