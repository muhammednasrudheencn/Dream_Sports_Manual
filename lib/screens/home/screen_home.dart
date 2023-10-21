import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_profile.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_settings.dart';
import 'package:dream_sports_turf_owner/screens/home/screen_turf_add.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediqauery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 232, 232),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: homecolor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => const TurfAddingScreen()));
        },
        label: Row(
          children: [
            const Text(
              'Add Your Own Turf',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(width: mediqauery.width * 0.4),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: mediqauery.width,
                    height: mediqauery.height * 0.4,
                    decoration: const BoxDecoration(
                        color: homecolor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi...',
                            style: TextStyle(
                                fontSize: 50,
                                color: whiteback,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Turf Owner',
                            style: TextStyle(fontSize: 30, color: whiteback),
                          ),
                          SizedBox(height: 50),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Welcome !',
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: whiteback,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'To Dream Sports',
                                  style:
                                      TextStyle(fontSize: 20, color: whiteback),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ProfileScreen())),
                      child: Container(
                        width: mediqauery.width,
                        height: mediqauery.height * 0.1,
                        decoration: const BoxDecoration(
                            color: whiteback,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Goto Your Profile',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    sheight,
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const SettingsScreen())),
                      child: Container(
                        width: mediqauery.width,
                        height: mediqauery.height * 0.1,
                        decoration: const BoxDecoration(
                            color: whiteback,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Settings',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
