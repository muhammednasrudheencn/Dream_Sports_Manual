// ignore_for_file: use_build_context_synchronously
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_turf_add.dart';
import 'package:dream_sports_turf_owner/screens/registeration/screen_register.dart';
import 'package:dream_sports_turf_owner/screens/start/screen_authentication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const savekey = 'user loging';

userlogin(BuildContext context) async {
  final loginkey = await SharedPreferences.getInstance();
  await loginkey.setBool(savekey, true);
}

userlogout(BuildContext context) async {
  final loginkey = await SharedPreferences.getInstance();
  await loginkey.clear();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (ctx) => SignupScreen()),
    (route) => false,
  );
}
