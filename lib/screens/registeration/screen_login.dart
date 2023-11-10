import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/screens/registeration/screen_register.dart';
import 'package:dream_sports_turf_owner/widgets/const_widget.dart';
import 'package:dream_sports_turf_owner/widgets/register_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String? phone;
  LoginScreen({super.key, this.phone});
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Dont Have An Account ?",
            style: TextStyle(color: blackback),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => RegisterScreen(
                            phone: phone,
                          )));
            },
            child: const Text(
              "Create Account",
              style: TextStyle(color: blackback),
            ),
          ),
        ],
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
                onPressed: () {},
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

  userlogincheck(
      {var password, var username, var phone, BuildContext? context}) {
    if (passwordcontroller.text.trim() == password &&
            usernamecontroller.text.trim() == username ||
        usernamecontroller.text.trim() == phone) {
      Navigator.pushReplacement(
          context!, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content:
            Text('Not Match Username,Password', style: TextStyle(fontSize: 15)),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'If you Forgot Your Pass word , Please Create A new Account',
            style: TextStyle(fontSize: 15)),
        backgroundColor: Color.fromARGB(255, 94, 94, 94),
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    }
  }
}
