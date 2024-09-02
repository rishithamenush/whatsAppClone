import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/features/app/const/app_const.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

import '../../../app/home/home_page.dart';
import '../widgets/profile_widget.dart';

class InitialProfileSubmitPage extends StatefulWidget {
  const InitialProfileSubmitPage({super.key});

  @override
  State<InitialProfileSubmitPage> createState() => _InitialProfileSubmitPageState();
}

class _InitialProfileSubmitPageState extends State<InitialProfileSubmitPage> {

  final TextEditingController _usernameController = TextEditingController();
  File? _image;

  Future<void> selectImage() async {
    try {
      final pickedFile = await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("No image has been selected");
        }
      });
    } catch (e) {
      toast("Some error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "Profile Info",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: tabColor
                  ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please Provide your name and an optional profile \nphoto",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: selectImage,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: profileWidget(image: _image),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 1.5),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: tabColor, width: 1.5)
                    )
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}