



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unh_biblio/src/home_page.dart';
//import 'package:get/get.dart';



class RouteManager {

  static void goto(BuildContext context, {
    required Widget page,
    required String routeName,
    dynamic args,
  }){
    if(!kIsWeb){
      //Navigator.of(context).push(route);
      Navigator.push(context,
          MaterialPageRoute<void>(builder: (_) => page)
      );
      //Get.to(() => page);
    } else{
      Navigator.pushNamed<void>(context, routeName);
      //Get.toNamed(routeName);
    }
  }
  static final kRoutes = <String, WidgetBuilder>{
    HomePage.routeName         : (BuildContext context) => const HomePage(),
    //LoginPage.routeName        : (BuildContext context) => const LoginPage(),
    //AboutPage.routeName        : (BuildContext context) => const AboutPage(),
    //SettingPage.routeName      : (BuildContext context) => const SettingPage(),
    //AddProductScreen.routeName : (BuildContext context) => const AddProductScreen(),
    //ChatPage.routeName         : (BuildContext context) => const ChatPage(),
    //MessagesPage.routeName     : (BuildContext context) => const MessagesPage(),
  };
}