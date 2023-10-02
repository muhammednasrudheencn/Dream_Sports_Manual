import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:flutter/material.dart';

Widget textfield1({
  required TextEditingController controller,
  Icon? preicon,
  required String? hint,
}) {
  return TextField(
    decoration: InputDecoration(
        filled: true,
        fillColor: whiteback,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: whiteback),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: homecolor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: preicon,
        hintText: hint),
    controller: controller,
  );
}

Widget textfielddiscription({
  required TextEditingController controller,
  Icon? preicon,
  required String? hint,
  var width,
  var height,
}) {
  return TextField(
    minLines: 2,
    maxLines: 3,
    decoration: InputDecoration(
      filled: true,
      fillColor: whiteback,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: whiteback),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: homecolor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      prefixIcon: preicon,
      hintText: hint,
    ),
    controller: controller,
  );
}
