
import 'package:flutter/material.dart';
import 'package:user_management/presentation/router/route_list.dart';
import 'package:user_management/presentation/screens/user/user_screen.dart';

class RouterGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    // final args = settings.arguments;
    switch(settings.name) {
      case routeUser:
        return MaterialPageRoute(
          builder: (_) => const UserScreen(),
          settings: const RouteSettings(name: routeUser)
        );
    }
    return null;
  }
}