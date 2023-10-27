import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/registeration/screen_login.dart';
import 'package:dream_sports_turf_owner/screens/authentications/screen_authentication.dart';
import 'package:dream_sports_turf_owner/widgets/const_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verify;
  final String? phone;
  const OtpScreen({super.key, required this.verify, this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: const TextStyle(
          fontSize: 22,
          color: blackback,
        ),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ));

    // final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 35, letterSpacing: 1),
              ),
              sheight,
              sheight,
              Text(
                'Enter The Verification Code.\nSent To : ${widget.phone}',
                style: const TextStyle(fontSize: 14, letterSpacing: 2),
              ),
              const SizedBox(
                height: 40,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!
                        .copyWith(border: Border.all(color: homecolor))),
                onChanged: (value) {
                  if (value.length == 6) {
                    verifyotp(context, value.trim());
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              sheight,
              sheight,
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: homecolor,
              //       fixedSize:
              //           Size(mediaquery.width * 1, mediaquery.height * 0.05)),
              //   onPressed: () async {},
              //   child: const Text(
              //     'Verify',
              //     style:
              //         TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navigatedtextbutton(context, 'Change Number', SignupScreen()),
                  TextButton(onPressed: () {}, child: const Text('Resend'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  verifyotp(BuildContext context, String otp) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verify, smsCode: otp);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (ctx) => LoginScreen(
                    phone: widget.phone,
                  )),
          (route) => false);
    } catch (e) {
      print('Wrong OTP');
      print(e.toString());
    }
  }
}
