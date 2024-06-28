import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class ProfilePage extends StatefulWidget {
  String ad;
  String mail;
  String no;
  String sehir;
  String ilce;
  String mahalle;
  String sokak;
  String pass;

  ProfilePage({
    required this.ad,
    required this.mail,
    required this.no,
    required this.sehir,
    required this.ilce,
    required this.mahalle,
    required this.sokak,
    required this.pass,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController adController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController sehirController = TextEditingController();
  TextEditingController ilceController = TextEditingController();
  TextEditingController mahalleController = TextEditingController();
  TextEditingController sokakController = TextEditingController();



  @override
  void initState() {
    super.initState();
    // Alanları başlangıçta boş bırakmak için text atamalarını kaldır
  }

  void updateProfile() {
    setState(() {
      widget.ad = adController.text.isNotEmpty ? adController.text : widget.ad;
      widget.mail =
      mailController.text.isNotEmpty ? mailController.text : widget.mail;
      widget.no = noController.text.isNotEmpty ? noController.text : widget.no;
      widget.sehir =
      sehirController.text.isNotEmpty ? sehirController.text : widget.sehir;
      widget.ilce =
      ilceController.text.isNotEmpty ? ilceController.text : widget.ilce;
      widget.mahalle =
      mahalleController.text.isNotEmpty ? mahalleController.text : widget
          .mahalle;
      widget.sokak =
      sokakController.text.isNotEmpty ? sokakController.text : widget.sokak;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Sayfası'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kullanıcı Bilgileri', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text(
                      'Ad Soyad: ${widget.ad}', style: TextStyle(fontSize: 16)),
                  Text('Email: ${widget.mail}', style: TextStyle(fontSize: 16)),
                  Text('Telefon Numarası: ${widget.no}',
                      style: TextStyle(fontSize: 16)),
                  Text(
                      'Şehir: ${widget.sehir}', style: TextStyle(fontSize: 16)),
                  Text('İlçe: ${widget.ilce}', style: TextStyle(fontSize: 16)),
                  Text('Mahalle: ${widget.mahalle}',
                      style: TextStyle(fontSize: 16)),
                  Text(
                      'Sokak: ${widget.sokak}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kullanıcı Bilgilerini Güncelle', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  TextField(
                    controller: adController,
                    decoration: InputDecoration(labelText: 'Ad Soyad'),
                  ),
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: noController,
                    decoration: InputDecoration(labelText: 'Telefon Numarası'),
                  ),
                  TextField(
                    controller: sehirController,
                    decoration: InputDecoration(labelText: 'Şehir'),
                  ),
                  TextField(
                    controller: ilceController,
                    decoration: InputDecoration(labelText: 'İlçe'),
                  ),
                  TextField(
                    controller: mahalleController,
                    decoration: InputDecoration(labelText: 'Mahalle'),
                  ),
                  TextField(
                    controller: sokakController,
                    decoration: InputDecoration(labelText: 'Sokak'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // await addUserToFirestore();
                      updateProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profil bilgileri güncellendi')),
                      );
                    },
                    child: Text('Güncelle'),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   Future<void> addUserToFirestore() async {
//     try {
//       await _firebaseFirestore.collection('users').add({
//         'ad': ad,
//         'mail': mail,
//         'no': no,
//         'sehir': sehir,
//         'ilce': ilce,
//         'mahalle': mahalle,
//         'sokak': sokak,
//         'kullaniciTur': _selectedUser,
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Kullanıcı başarıyla eklendi!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Kullanıcı eklenirken hata oluştu: $e')),
//       );
//     }
//   }
// }

