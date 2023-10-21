import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/services/firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: store
                    .collection('TurfDetails')
                    .doc(auth.currentUser!.uid)
                    .collection('images')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final url = snapshot.data!.docs[0]['turfimage'];
                  return url != null
                      ? Container(
                          width: mediaquery.width,
                          height: mediaquery.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(url), fit: BoxFit.cover)),
                        )
                      : Container(
                          width: mediaquery.width,
                          height: mediaquery.height * 0.25,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1544914379-806667cd9489?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHVyZnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                  fit: BoxFit.cover)),
                        );
                },
              ),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: store
                      .collection('TurfDetails')
                      .doc(auth.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    return data.isNotEmpty
                        ? SizedBox(
                            width: mediaquery.width,
                            height: mediaquery.height * 0.20,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data['courtname'],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    sheight,
                                    Text(
                                      data['location'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 83, 83, 83),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      '+91 ${data['contactinfo']}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 83, 83, 83),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      data['discription'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 83, 83, 83),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text('Loading'),
                          );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
