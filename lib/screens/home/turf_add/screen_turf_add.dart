import 'dart:io';

import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/constants/methods.dart';
import 'package:dream_sports_turf_owner/services/firestore.dart';
import 'package:dream_sports_turf_owner/widgets/const_widget.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class TurfAddingScreen extends StatefulWidget {
  const TurfAddingScreen({Key? key}) : super(key: key);

  @override
  State<TurfAddingScreen> createState() => _TurfAddingScreenState();
}

class _TurfAddingScreenState extends State<TurfAddingScreen> {
  final formkey = GlobalKey<FormState>();
  File? _image;
  File? profile;
  String? downimag;
  String? downimage;
  final courtnamecontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     userlogout(context);
      //   },
      //   child: Icon(Icons.logout),
      // ),
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          builder: (context) => imgbottom(
                              height: mediaquery.height * 0.22,
                              toheight: mediaquery.height * 0.06,
                              towidth: mediaquery.width));
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: whiteback,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: mediaquery.width,
                          height: mediaquery.height * 0.25,
                          child: _image == null
                              ? const Center(
                                  child: Text(
                                  'Tap To Add Your Turf Image',
                                  style: TextStyle(fontSize: 15),
                                ))
                              : Container(
                                  width: mediaquery.width,
                                  height: mediaquery.height * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                builder: (context) => profileselector(
                                    height: mediaquery.height * 0.22,
                                    toheight: mediaquery.height * 0.06,
                                    towidth: mediaquery.width));
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                            child: profile != null
                                ? CircleAvatar(
                                    radius: 39,
                                    backgroundColor: whiteback,
                                    backgroundImage: Image.file(profile!).image,
                                  )
                                : CircleAvatar(
                                    radius: 39,
                                    backgroundColor: whiteback,
                                    backgroundImage: Image.network(user).image,
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10), // Add appropriate spacing
                  TextFormField(
                    controller: courtnamecontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: whiteback,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Court Name',
                    ),
                    //controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Court Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  sheight,
                  TextFormField(
                    controller: locationcontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: whiteback,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Location',
                    ),
                    //controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Location';
                      } else {
                        return null;
                      }
                    },
                  ),
                  sheight,
                  TextFormField(
                    controller: contactcontroller,

                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: whiteback,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Contact Info',
                    ),
                    //controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your contact info';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10), // Add appropriate spacing
                  TextFormField(
                    controller: discriptioncontroller,
                    minLines: 3,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: whiteback,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Court Description', // Change the hint text
                    ),
                    //controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Court Description'; // Update the validation message
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        uploadimage(downimage: downimag, image: _image);
                        uploadavatar(downimage: downimage, profile: profile);
                        store
                            .collection('TurfDetails')
                            .doc(auth.currentUser!.uid)
                            .set({
                          'courtname': courtnamecontroller.text.trim(),
                          'location': locationcontroller.text.trim(),
                          'discription': discriptioncontroller.text.trim(),
                          'contactinfo': contactcontroller.text.trim(),
                          'userid': auth.currentUser!.uid,
                        });
                        addingSuccess(context, courtnamecontroller);
                      } else {
                        addingFailed(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: homecolor,
                        fixedSize:
                            Size(mediaquery.width, mediaquery.height * 0.06)),
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getimage({required ImageSource sorce}) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(source: sorce);
      if (pickedImage == null) return null;
      File? image = File(pickedImage.path);
      image = await imgcrop(imagefile: image);
      setState(() {
        _image = image;
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  getprofile({required ImageSource sorce}) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(source: sorce);
      if (pickedImage == null) return null;
      File? image = File(pickedImage.path);
      image = await imgcrop(imagefile: image);
      setState(() {
        profile = image;
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  Future<File?> imgcrop({required File imagefile}) async {
    CroppedFile? cropedimage =
        await ImageCropper().cropImage(sourcePath: imagefile.path);
    if (cropedimage == null) return null;
    return File(cropedimage.path);
  }

  imgbottom({var width, var height, var toheight, var towidth}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Photo',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getimage(sorce: ImageSource.camera);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Use Camera',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text('OR', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getimage(sorce: ImageSource.gallery);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Brouser Gallery',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }

  profileselector({var width, var height, var toheight, var towidth}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Photo',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getprofile(sorce: ImageSource.camera);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Use Camera',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text('OR', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getprofile(sorce: ImageSource.gallery);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Brouser Gallery',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }
}
