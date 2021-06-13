import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/main_screen.dart';
import 'screens/data_booking.dart';
import 'util/const.dart';
import 'screens/logout.dart';
import 'screens/login.dart';
import 'dart:io';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new MainScreen(),
        '/Login': (BuildContext context) => new LoginPage(),
        '/DataBooking': (BuildContext context) => new DataBooking(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
