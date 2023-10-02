import 'package:dream_sports_turf_owner/screens/start/screen_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DreamSportsTurfOwners());
}

class DreamSportsTurfOwners extends StatelessWidget {
  const DreamSportsTurfOwners({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Play'),
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
    );
  }
}
