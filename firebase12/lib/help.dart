import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Yardım Merkezi'),
      ),
      body: Center(
        child: Text('Yardım Merkezi sayfası'),
      ),
    );
  }
}