import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:user_management/presentation/core/app_widget.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  /// Fixing  CERTIFICATE_VERIFY_FAILED on android 11
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const AppWidget();
        },
      ),
    )
  );
}