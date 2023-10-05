import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_home.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_turf_add.dart';
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
  TextEditingController courtnamecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();

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
                    hint: 'Phone',
                    type: TextInputType.phone),
                sheight,
                textfield1(
                  controller: emailcontroller,
                  hint: 'Email',
                ),
                sheight,
                textfield1(
                  controller: courtnamecontroller,
                  hint: 'Court Name',
                ),
                sheight,
                textfield1(
                  controller: locationcontroller,
                  hint: 'Location',
                ),
                sheight,
                textfielddiscription(
                    controller: discriptioncontroller,
                    hint: 'discription',
                    width: mediaquery.width,
                    height: mediaquery.height * 0.20,
                    rtprint: 'Please Take Discription'),
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
                        courtname: courtnamecontroller.text.trim(),
                        location: locationcontroller.text.trim(),
                        discription: discriptioncontroller.text.trim());
                    userlogin(context);
                    // showsnackbar(
                    //     context: context,
                    //     content: 'Account Creating Success',
                    //     color: Colors.green);
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
