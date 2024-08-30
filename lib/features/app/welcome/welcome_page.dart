import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(child: Text("Welcome to Whatsapp Clone", style: TextStyle(fontSize: 20),),),
            Image.asset("assets/bg_image.png"),
            Column(
              children: [
                const Text("Read our Privacy Tap, 'Agree and Continue' to accept the Team of Service. "),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: tabColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text("AGREE AND CONTINUE", style: TextStyle(color: Colors.white),),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
