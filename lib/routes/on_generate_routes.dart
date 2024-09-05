
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/home/contacts_page.dart';

import '../features/app/const/page_const.dart';

class OnGenerateRoutes{
  static Route<dynamic>? route(RouteSettings settings){
    final args = settings.arguments;
    final name = settings.name;

    switch (name){
      case PageConst.contactUserPage:
        {
          return materialPageBuilder (const ContactsPage());
        }
    }
  }
  static dynamic materialPageBuilder(Widget child){
    return MaterialPageRoute(builder: (context) => child);
  }
 }