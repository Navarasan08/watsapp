

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsapp/src/modals/chats/chats.dart';
import 'package:watsapp/src/views/screens.dart';
import 'package:watsapp/src/widgets/splash_screen.dart';

class AppRouter {

  static const String splash = "/";
  static const String home = "/home";
  static const String chatRoom = "/chat_room";
  static const String selectContact = "/selectContact";
  static const String selectCallContact = "/selectCallContact";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {

      case splash:
        return MaterialPageRoute(
          settings: RouteSettings(name: "/splash"),
          builder: (_) => SplashScreen(),);
        break;

      case home:
        return MaterialPageRoute(
          settings: RouteSettings(name: "/homeRoute"),
          builder: (_) => Home(),);
        break;

      case chatRoom:
        Chats chat = settings.arguments as Chats;
        return MaterialPageRoute(
          settings: RouteSettings(name: "/chatRoute"),
          builder: (_) => ChatRoom(chats: chat),);
        break;

      case selectContact:
        return MaterialPageRoute(
          builder: (_) => SelectContact());
        break;

      case selectCallContact:
        return MaterialPageRoute(
            builder: (_) => SelectCallContact());
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));

    }
  }
}