
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/home/contacts_page.dart';

import '../features/app/const/page_const.dart';
import '../features/app/settings/settings_page.dart';

class OnGenerateRoutes{
  static Route<dynamic>? route(RouteSettings settings){
    final args = settings.arguments;
    final name = settings.name;

    switch (name){
      case PageConst.contactUserPage:
        {
          return materialPageBuilder (const ContactsPage());
        }
      case PageConst.settingsPage:{
        return materialPageBuilder(const SettingsPage());
      }
      // case PageConst.callContactsPage:{
      //   return materialPageBuilder(CallContactsPage(currentUser:args));
      // }
      // case PageConst.myStatusPage:{
      //   return materialPageBuilder(MyStatusPage(status: args));
      // }
      // case PageConst.singleChatPage:{
      //   return materialPageBuilder(SingleChatPage(appEntity: args));
      // }
    }
  }
  static dynamic materialPageBuilder(Widget child){
    return MaterialPageRoute(builder: (context) => child);
  }
 }