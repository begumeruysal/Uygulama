import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'order_screen.dart';
import 'track_screen.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geri Dönüşüm Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(name: '', email: ''),
        '/order': (context) => OrderScreen(),
        '/track': (context) => TrackScreen(),
        '/menu': (context) => MenuScreen(name: '', email: ''),
      },
    );
  }
}
