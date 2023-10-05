import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_turf_add.dart';
import 'package:dream_sports_turf_owner/screens/registeration/screen_register.dart';
import 'package:dream_sports_turf_owner/widgets/const_widget.dart';
import 'package:dream_sports_turf_owner/widgets/register_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String? phone;
  LoginScreen({super.key, this.phone});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => RegisterScreen(
                        phone: phone,
                      )));
        },
        label: const Text(
          "Don't Have an Acount",
          style: TextStyle(color: blackback),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(logo),
                width: mediaquery.width * 0.6,
              ),
              fieldtext('User Name'),
              const SizedBox(height: 10),
              textfield1(
                  controller: usernamecontroller,
                  hint: 'User Name',
                  preicon: const Icon(Icons.person)),
              const SizedBox(height: 10),
              fieldtext('Password'),
              const SizedBox(height: 10),
              textfield1(
                  controller: passwordcontroller,
                  hint: 'Password',
                  preicon: const Icon(Icons.password_outlined)),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: homecolor,
                    fixedSize:
                        Size(mediaquery.width, mediaquery.height * 0.06)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()));
                },
                child: const Text(
                  'Continue',
                  style:
                      TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
