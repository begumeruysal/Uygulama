import 'package:flutter/material.dart';

class BadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Rozetler'),
      ),
      body: Center(
        child: Text('Rozetler sayfası'),
      ),
    );
  }
}