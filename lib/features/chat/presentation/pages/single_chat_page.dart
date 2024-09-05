import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username'
            ),
            Text(
              "Online", style:  TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.videocam_rounded,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            size: 22,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_vert,
            size: 22,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Image.asset("assets/whatsapp_bg_image.png",
            fit: BoxFit.cover,),
          ),
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _messageLayout(
                      message: "Hello",
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: messageColor,
                      onLongPress: (){},
                      onSwipe: (details) {
                        // Handle swipe action here
                        print('Message swiped');
                      },
                    ),
                    _messageLayout(
                      message: "How are you?",
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: messageColor,
                      onLongPress: (){},
                      onSwipe: (details) {
                        // Handle swipe action here
                        print('Message swiped');
                      },
                    ),
                    _messageLayout(
                      message: "Hi",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: false,
                      messageBgColor: senderMessageColor,
                      onLongPress: (){},
                      onSwipe: (details) {
                        // Handle swipe action here
                        print('Message swiped');
                      },
                    ),
                    _messageLayout(
                      message: "Doing good, how about you?",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: senderMessageColor,
                      onLongPress: (){},
                      onSwipe: (details) {
                        // Handle swipe action here
                        print('Message swiped');
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  _messageLayout({
    Color? messageBgColor,
    Alignment? alignment,
    Timestamp? createAt,
    void Function(DragUpdateDetails)? onSwipe,
    String? message,
    bool? isShowTick,
    bool? isSeen,
    VoidCallback? onLongPress
}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SwipeTo(
        onRightSwipe: onSwipe,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            alignment: alignment,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 5, right: 85, top: 5, bottom: 5),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.80,
                      ),
                      decoration: BoxDecoration(
                        color: messageBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$message",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 3,),
                  ],
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(DateFormat.jm().format(createAt!.toDate()),
                      style: const TextStyle(fontSize: 12, color: lightGreyColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      isShowTick == true
                        ? Icon(
                        isSeen == true? Icons.done_all : Icons.done,
                        size: 16,
                        color: isSeen == true ? Colors.blue : lightGreyColor,
                      )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
}
}
