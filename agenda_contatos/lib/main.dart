import 'package:flutter/material.dart';
import 'package:agenda_contatos/ui/home_page.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  
  FlutterStatusbarcolor.setStatusBarColor(Colors.blueAccent);
  runApp(
    MaterialApp(
      home: HomePage(),
      //home: ContactPage(),
      debugShowCheckedModeBanner: false,
      // theme: new ThemeData(
      //     primaryTextTheme: TextTheme(title: TextStyle(color: Colors.grey))),
    ),
  );
}
