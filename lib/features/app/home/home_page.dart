import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/home/contacts_page.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';
import 'package:whatsapp_clone/features/status/presentation/pages/status_page.dart';

import '../../call/presentation/pages/call_history_page.dart';
import '../../chat/presentation/pages/chat_page.dart';
import '../const/page_const.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
   int _currentTabIndex = 0;


   @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener((){
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.w600
          ),
        ),
        actions:  [
          Row(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: textColor,
                size: 20,
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(Icons.search, color: textColor,size: 28,),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton<String>(
                icon:  const Icon(
                  Icons.more_vert,
                  color: greyColor,
                  size: 28,
                ),
                color: appBarColor,
                iconSize: 28,
                onSelected: (value){},
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                      value: "Settings",
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(
                              context, PageConst.settingsPage);
                        },
                        child: const Text("Settings"),
                      ),
                  )
                ]

              ),
            ],
          ),
        ],
        bottom:  TabBar(
          controller: _tabController,
          labelColor: tabColor,
          unselectedLabelColor: textColor,
          indicatorColor: tabColor,
          tabs: const [
            Tab(
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w600
                ),
              ),
            ),
            Tab(
              child: Text(
                "Status",
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600
                ),
              ),
            ),
            Tab(
              child: Text(
                "Calls",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: switchFloatingActionButtonOnTabIndex(
        _currentTabIndex,
      ),
      body: TabBarView(
        controller: _tabController,

        children: const [
          ChatPage(),
          StatusPage(),
          CallHistoryPage(),
        ],
      ),
    );
  }
  switchFloatingActionButtonOnTabIndex(int index){
     switch(index){
       case 0:
         {
           return FloatingActionButton(
             backgroundColor: tabColor,
             onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactsPage()));
               Navigator.pushNamed(context, PageConst.contactUserPage);
             },
             child: const Icon(
               Icons.message,
               color: Colors.white,
             ),
           );
         }
       case 1:
         {
           return FloatingActionButton(
             backgroundColor: tabColor,
             onPressed: (){},
             child: const Icon(
               Icons.camera_alt,
               color: Colors.white,
             ),
           );
         }
       case 2:
         {
           return FloatingActionButton(
             backgroundColor: tabColor,
             onPressed: (){
               Navigator.pushNamed(context, PageConst.callContactsPage);
             },
             child: const Icon(
               Icons.add_call,
               color: Colors.white,
             ),
           );
         }
       default:
         {
           return FloatingActionButton(
             backgroundColor: tabColor,
             onPressed: (){},
             child: const Icon(
               Icons.message,
               color: Colors.white,
             ),
           );
         }
     }
  }
}
