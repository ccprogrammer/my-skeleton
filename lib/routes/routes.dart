import 'package:flutter/material.dart';
import 'package:my_skeleton/ui/screen/INITIAL_SCREEN/initial_screen.dart';
import 'package:my_skeleton/ui/screen/form_screen/form_screen.dart';
import 'package:my_skeleton/ui/screen/home_main_screen/home_main_screen.dart';

abstract class AppRoute {
  static const initial = '/initial';
  static const registerInfo = '/register-tab';
  static const home = '/home';
}

class GetRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.initial:
        return MaterialPageRoute(builder: (context) => const InitialScreen());

      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => const HomeMainScreen());

      case AppRoute.registerInfo:
        return MaterialPageRoute(builder: (context) => const FormScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const InitialScreen(),
        );
    }
  }
}
