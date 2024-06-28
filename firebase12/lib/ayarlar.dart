import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Ayarlar'),
      ),
      body: Center(
        child: Text('Ayarlar sayfası'),
      ),
    );
  }
}