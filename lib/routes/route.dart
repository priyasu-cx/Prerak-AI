import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prerak_ai/routes/route_path.dart';
import 'package:prerak_ai/screens/chat/chatscreen.dart';
import 'package:prerak_ai/screens/home/homescreen.dart';

abstract class PrerakAIRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget currentWidget;

    switch (settings.name) {
      case RoutePath.routeInitial:
      case RoutePath.routeHome:
        currentWidget = const HomeScreen();
        break;

      case RoutePath.routeChat:
        currentWidget = const ChatScreen();
        break;

      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return _PrekakAIRoute(screen: currentWidget, settings: settings);
  }
  static void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutePath.routeHome, (route) => false);
  }
}

class _PrekakAIRoute extends PageRouteBuilder {
  final Widget screen;
  final RouteSettings settings;

  _PrekakAIRoute({required this.screen, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    screen,
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}