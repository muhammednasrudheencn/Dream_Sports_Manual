import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:flutter/material.dart';

Widget headingtext({String? heading}) {
  return Text(
    heading!,
    style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: blackback),
  );
}

Widget messageinput(
    {required TextEditingController controller,
    Icon? preicon,
    required String? hint,
    TextInputType? type,
    var length}) {
  return TextField(
    keyboardType: type,
    maxLength: length,
    decoration: InputDecoration(
        filled: true,
        fillColor: whiteback,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        prefixIcon: preicon,
        hintText: hint),
    controller: controller,
  );
}
