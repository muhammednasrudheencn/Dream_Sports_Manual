import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/authentications/screen_otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(logo),
                width: mediaquery.width * 0.6,
              ),
              const Text('Start With Dream Sports',
                  style: TextStyle(
                      fontSize: 15, letterSpacing: 3, color: blackback)),
              sheight,
              sheight,
              sheight,
              sheight,
              sheight,
              IntlPhoneField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    hintText: 'Phone Number'),
                initialCountryCode: 'IN',
                controller: phonecontroller,
                showCountryFlag: true,
              ),
              sheight,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: homecolor,
                    fixedSize:
                        Size(mediaquery.width * 1, mediaquery.height * 0.05)),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${phonecontroller.text}',
                    timeout: const Duration(seconds: 60),
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => OtpScreen(
                                    verify: verificationId,
                                    phone: phonecontroller.text.trim(),
                                  )));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: const Text(
                  'Send Code',
                  style:
                      TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
