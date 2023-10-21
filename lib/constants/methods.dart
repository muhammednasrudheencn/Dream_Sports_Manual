import 'package:flutter/material.dart';

void addingSuccess(BuildContext context, TextEditingController courtname) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('${courtname.text} Is Added Successfully'),
    backgroundColor: Colors.green,
    margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: const Duration(seconds: 2),
  ));

  Navigator.of(context).pop();
}

void addingFailed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Please Fill All Required Fields!"),
    backgroundColor: Colors.red,
    margin: EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: Duration(seconds: 2),
  ));
}
