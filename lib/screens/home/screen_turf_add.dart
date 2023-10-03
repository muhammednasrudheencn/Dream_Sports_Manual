import 'package:dream_sports_turf_owner/constants/colors.dart';
import 'package:dream_sports_turf_owner/widgets/const_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class TurfAddingScreen extends StatelessWidget {
  const TurfAddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: mediaquery.width,
                  height: mediaquery.height * 0.25,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          imgbottom(height: mediaquery.height * 0.12),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: whiteback,
                  ),
                )
              ]),
              const SizedBox(height: 10), // Add appropriate spacing
              TextFormField(
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
              const SizedBox(height: 10), // Add appropriate spacing
              TextFormField(
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
                  // Handle the selected image from the camera here
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
    );
  }

  getimage({required ImageSource sorce}) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: sorce);
  }

  imgbottom({var width, var height}) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fieldtext('Choose Profile Pic'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    getimage(sorce: ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    getimage(sorce: ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Camera'),
                SizedBox(width: 30),
                Text('Gallery'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
