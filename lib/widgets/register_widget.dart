import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:flutter/material.dart';

Widget textfield1({
  required TextEditingController controller,
  Icon? preicon,
  required String? hint,
  var rtprint,
}) {
  return TextFormField(
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
    validator: (value) {
      if (value == null || value.isEmpty) {
        return rtprint;
      } else {
        return null;
      }
    },
  );
}

Widget textfielddiscription(
    {required TextEditingController controller,
    Icon? preicon,
    required String? hint,
    var width,
    var height,
    var rtprint,
    GlobalKey? formkey}) {
  return Form(
    key: formkey,
    child: TextFormField(
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return rtprint;
          } else {
            return null;
          }
        }),
  );
}
