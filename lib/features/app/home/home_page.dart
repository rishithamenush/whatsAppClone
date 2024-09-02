import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 20,
            color: greyColor,
            fontWeight: FontWeight.w600
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: greyColor,
                size: 20,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(Icons.search, color: greyColor,size: 28,),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert, color: greyColor,size: 28,)
            ],
          )
        ],
      ),
    );
  }
}
