import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class CallHistoryPage extends StatefulWidget {
  const CallHistoryPage({super.key});

  @override
  State<CallHistoryPage> createState() => _CallHistoryPageState();
}

class _CallHistoryPageState extends State<CallHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Recent",
              style: TextStyle(
                fontSize: 15,
                color: greyColor,
                fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
