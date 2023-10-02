import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/widgets/register_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController courtnamecontroller = TextEditingController();
    TextEditingController locationcontroller = TextEditingController();
    TextEditingController discriptioncontroller = TextEditingController();
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: const AssetImage(logo),
                  width: mediaquery.width * 0.6,
                ),
                textfield1(controller: usernamecontroller, hint: 'User Name'),
                sheight,
                textfield1(controller: phonecontroller, hint: 'Phone'),
                sheight,
                textfield1(controller: emailcontroller, hint: 'Email'),
                sheight,
                textfield1(controller: courtnamecontroller, hint: 'Court Name'),
                sheight,
                textfield1(controller: locationcontroller, hint: 'Location'),
                sheight,
                textfielddiscription(
                    controller: discriptioncontroller,
                    hint: 'discription',
                    width: mediaquery.width,
                    height: mediaquery.height * 0.20),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: homecolor,
                      fixedSize:
                          Size(mediaquery.width, mediaquery.height * 0.06)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const HomeScreen()));
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        letterSpacing: 1, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
