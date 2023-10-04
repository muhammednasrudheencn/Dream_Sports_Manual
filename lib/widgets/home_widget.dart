import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_turf_add.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

TurfAddingScreen turf = const TurfAddingScreen();

Widget selectbutton(
    {Icon? preicon, var hint, var width, var height, ImageSource? source}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: whiteback,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)))),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        preicon!,
        const SizedBox(width: 10),
        Text(
          hint,
          style: const TextStyle(color: blackback, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
