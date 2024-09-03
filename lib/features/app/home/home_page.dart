import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
   int _currentTabIndex = 0;

   final List<Widget> _page = [
     const Center(child: Text("Chats"),),
     const Center(child: Text("Updates"),),
     const Center(child: Text("Communities"),),
     const Center(child: Text("Calls"),),
   ];

   @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
        actions: const [
          Row(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: textColor,
                size: 20,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(Icons.search, color: textColor,size: 28,),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert, color: textColor,size: 28,)
            ],
          ),
        ],
        bottom: const TabBar(
          tabs: [
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

    );
  }
}
