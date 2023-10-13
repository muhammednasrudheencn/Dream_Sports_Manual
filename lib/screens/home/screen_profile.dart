import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/services/firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: store
            .collection('TurfOwner')
            .doc(auth.currentUser!.uid)
            .collection('images')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          String url = snapshot.data!.docs[0]['turfimage'];
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading'),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      width: mediaquery.width,
                      height: mediaquery.height * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(url), fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
