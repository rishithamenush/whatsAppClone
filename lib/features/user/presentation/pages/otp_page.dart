import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: const Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Verify your OTP",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tabColor
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter your OTP for the WhatsApp Clone Verification",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            _pinCodeWidget(),
            SizedBox(
              height: 30,
            )

          ],
        ),
      ),
    );
  }
}
