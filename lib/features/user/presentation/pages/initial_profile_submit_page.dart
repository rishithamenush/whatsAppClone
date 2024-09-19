import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/features/app/const/app_const.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:whatsapp_clone/storage/storage_provider.dart';

import '../../../app/home/home_page.dart';
import '../widgets/profile_widget.dart';

class InitialProfileSubmitPage extends StatefulWidget {

  final String phoneNumber;

  const InitialProfileSubmitPage({super.key, required this.phoneNumber});

  @override
  State<InitialProfileSubmitPage> createState() => _InitialProfileSubmitPageState();
}

class _InitialProfileSubmitPageState extends State<InitialProfileSubmitPage> {

  final TextEditingController _usernameController = TextEditingController();

  File? _image;
  bool _isProfileUpdating = false;

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
                  onTap: submitProfileInfo,
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
  void submitProfileInfo(){
    if(_image != null){
      StorageProviderRemoteDataSource.uploadProfileImage(
        file: _image!,
        onComplete: (onProfileUpdateComplete){
          setState(() {
            _isProfileUpdating = onProfileUpdateComplete;
          });
        }
      ). then((profileImageUrl){
        _profileInfo(
          profileUrl: profileImageUrl
        );
      });
    } else{
      _profileInfo(profileUrl: "");
    }
  }

  void _profileInfo({String? profileUrl}){
    if(_usernameController.text.isNotEmpty){
      BlocProvider.of<CredentialCubit>(context).submitProfileInfo(
        user: UserEntity(
          email: "",
          username: _usernameController.text,
          phoneNumber: widget.phoneNumber,
          status: "Hey There! I'm using WhatsApp Clone",
          isOnline: false,
          profileUrl: profileUrl,
        )
      );
    }
  }
}