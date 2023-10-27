import 'package:dream_sports_turf_owner/services/log_service.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userlogout(context);
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
