import 'package:flutter/material.dart';
import 'package:user_management/common/utils/navigation_utils.dart';
import 'package:user_management/presentation/router/route_list.dart';
import 'package:user_management/presentation/router/router_generator.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "User Management",
      initialRoute: routeUser,
      onGenerateRoute: RouterGenerator.generate,
    );
  }
}