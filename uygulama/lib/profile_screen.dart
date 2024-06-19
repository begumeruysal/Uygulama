import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  ProfileScreen({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text("Yağ atığı"),
              value: false,
              onChanged: (newValue) {},
            ),
            CheckboxListTile(
              title: Text("Organik atık"),
              value: false,
              onChanged: (newValue) {},
            ),
            CheckboxListTile(
              title: Text("Plastik atık"),
              value: false,
              onChanged: (newValue) {},
            ),
          ],
        ),
      ),
    );
  }
}
