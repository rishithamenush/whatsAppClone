import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/user/presentation/widgets/profile_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contacts"),
      ),
      body: ListView.builder(itemCount:20, itemBuilder: (context, index){
        return  ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: profileWidget(),
            ),
          ),
          title: const Text("Username"),
          subtitle: const Text("Hey there! I'm using WhatsApp"),
        );
      })
    );
  }
}
