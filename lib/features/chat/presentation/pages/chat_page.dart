import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';
import 'package:whatsapp_clone/features/user/presentation/widgets/profile_widget.dart';

import '../../../app/const/page_const.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(itemCount: 10, itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, PageConst.singleChatPage);
            },
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: profileWidget(),
                ),
              ),
              title: const Text("UserName"),
              subtitle: const Text("Last message hi", maxLines: 1, overflow: TextOverflow.clip,),
              trailing: Text(
                DateFormat.jm().format(DateTime.now()),
                style: const TextStyle(color: greyColor, fontSize: 13),
              ),
            ),
          );
        }),
      ),
    );
  }
}
