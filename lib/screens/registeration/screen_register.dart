import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/services/firestore.dart';
import 'package:dream_sports_turf_owner/services/log_service.dart';
import 'package:dream_sports_turf_owner/widgets/register_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final String? phone;
  const RegisterScreen({super.key, this.phone});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    phonecontroller.text = widget.phone!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final formkey = GlobalKey<FormState>();
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
                textfield1(
                  controller: usernamecontroller,
                  hint: 'User Name',
                ),
                sheight,
                textfield1(
                    controller: phonecontroller,
                    length: 10,
                    hint: 'Phone',
                    type: TextInputType.phone),
                sheight,
                textfield1(
                  controller: emailcontroller,
                  hint: 'Email',
                ),
                sheight,
                textfield1(
                  controller: passwordcontroller,
                  hint: 'Password',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: homecolor,
                      fixedSize:
                          Size(mediaquery.width, mediaquery.height * 0.06)),
                  onPressed: () {
                    addtofirestore(
                      username: usernamecontroller.text.trim(),
                      phone: phonecontroller.text.trim(),
                      email: emailcontroller.text.trim(),
                      password: passwordcontroller.text.trim(),
                    );
                    userlogin(context);
                    registerstatus();
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

  registerstatus() {
    if (usernamecontroller.text.trim().isEmpty ||
        passwordcontroller.text.trim().isEmpty ||
        phonecontroller.text.trim().isEmpty ||
        emailcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Registeration Failed Please Check Your Field',
            style: TextStyle(fontSize: 15)),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Registeration Success',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: homecolor,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    }
  }
}
