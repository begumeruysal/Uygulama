import 'package:flutter/material.dart';
import 'AnaSayfa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'atıkSec.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisEkrani(wasteSelectionPage:,),
      title: 'Uygulama Adı',
    );
  }
}

// Login Page
class GirisEkrani extends StatefulWidget {
  final WasteSelectionPage wasteSelectionPage;

  GirisEkrani({required this.wasteSelectionPage});

  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController adController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController noController = TextEditingController();
  final TextEditingController sehirController = TextEditingController();
  final TextEditingController ilceController = TextEditingController();
  final TextEditingController mahalleController = TextEditingController();
  final TextEditingController sokakController = TextEditingController();

  @override
  void dispose() {
    adController.dispose();
    mailController.dispose();
    noController.dispose();
    sehirController.dispose();
    ilceController.dispose();
    mahalleController.dispose();
    sokakController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: adController,
                decoration: InputDecoration(labelText: 'Ad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mailController,
                decoration: InputDecoration(labelText: 'E-posta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-postanızı girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: noController,
                decoration: InputDecoration(labelText: 'Telefon Numarası'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen telefon numaranızı girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: sehirController,
                decoration: InputDecoration(labelText: 'Şehir'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şehrinizi girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ilceController,
                decoration: InputDecoration(labelText: 'İlçe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen ilçenizi girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mahalleController,
                decoration: InputDecoration(labelText: 'Mahalle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen mahallenizi girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: sokakController,
                decoration: InputDecoration(labelText: 'Sokak'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen sokağınızı girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.wasteSelectionPage.updateUserInfo(
                      ad: adController.text,
                      mail: mailController.text,
                      no: noController.text,
                      sehir: sehirController.text,
                      ilce: ilceController.text,
                      mahalle: mahalleController.text,
                      sokak: sokakController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kullanıcı bilgileri güncellendi.')),
                    );
                  }
                },
                child: Text('Güncelle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Waste Selection Page




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WasteSelectionPage wasteSelectionPage = WasteSelectionPage(
      selectedWastes: [],
      onWastesUpdated: (updatedWastes) {
        // Handle the updated wastes
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: GirisEkrani(wasteSelectionPage: wasteSelectionPage),
    );
  }
}
