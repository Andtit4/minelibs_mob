import 'package:flutter/material.dart';

class PageTransition {
  static void fadeTransition(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static void fadeTransitionRemplacement (BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
     PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(seconds: 1),
      ),
    );
  }
}
