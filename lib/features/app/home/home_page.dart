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
      ),
      body: _page[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        selectedItemColor: tabColor,
        unselectedItemColor: textColor,
        items: [
          BottomNavigationBarItem(
            icon: _buildIconWithShadow(
              icon: Icons.chat,
              isSelected: _currentTabIndex == 0,
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithShadow(
              icon: Icons.camera_alt_outlined,
              isSelected: _currentTabIndex == 1,
            ),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithShadow(
              icon: Icons.groups,
              isSelected: _currentTabIndex == 2,
            ),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithShadow(
              icon: Icons.call,
              isSelected: _currentTabIndex == 3,
            ),
            label: "Calls",
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithShadow({required IconData icon, required bool isSelected}) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
        color: tabColor.withOpacity(0.2),
        shape: BoxShape.circle,
      )
          : null,
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon),
    );
  }
}