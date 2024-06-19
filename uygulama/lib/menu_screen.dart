import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class MenuScreen extends StatelessWidget {
  final String name;
  final String email;

  MenuScreen({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menü',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profil'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(name: name, email: email),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('Rozetler'),
          onTap: () {
            // Rozetler ekranına yönlendir
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Ayarlar'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(
                  initialName: name,
                  initialEmail: email,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Yardım Merkezi'),
          onTap: () {
            // Yardım Merkezi ekranına yönlendir
          },
        ),
      ],
    );
  }
}
