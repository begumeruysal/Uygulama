import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'atıkListe.dart';

class WasteSelectionPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedWastes;
  final Function(List<Map<String, dynamic>>) onWastesUpdated;

  final String pass;
  final String ad;
  final String mail;
  final String no;
  final String sehir;
  final String ilce;
  final String mahalle;
  final String sokak;

  WasteSelectionPage({
    required this.selectedWastes,
    required this.onWastesUpdated,
    required this.pass,
    required this.ad,
    required this.mail,
    required this.no,
    required this.sehir,
    required this.ilce,
    required this.mahalle,
    required this.sokak,
  });

  @override
  _WasteSelectionPageState createState() => _WasteSelectionPageState();
}

class _WasteSelectionPageState extends State<WasteSelectionPage> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool _isFoodWasteSelected = false;
  double _foodWasteAmount = 0;

  bool _isOilWasteSelected = false;
  double _oilWasteAmount = 0;

  void _saveWasteToFirestore(Map<String, dynamic> wasteData) async {
    final String userId = '${widget.ad}_${widget.mail}_${widget.no}';
    final userInfo = <String, dynamic>{
      "name": widget.ad,
      "email": widget.mail,
      "phone": widget.no,
      "address": "${widget.sehir}, ${widget.ilce}, ${widget.mahalle}, ${widget.sokak}",
    };

    try {
      await _firebaseFirestore.collection('users').doc(userId).set(userInfo, SetOptions(merge: true));
      await _firebaseFirestore.collection("users").doc(userId).collection("waste").add(wasteData);
      print("Atık verisi kaydedildi: ${wasteData.toString()}");
    } catch (e) {
      print("Error saving waste data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userId = '${widget.ad}_${widget.mail}_${widget.no}';
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,

              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffb9d5bd),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Atık bildirimi yapmak için:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Lütfen ilgili atığı seçin.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- İlgili atığın miktarını seçin.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Gönder butonuna tıklayın.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'ATIK TÜRÜ SEÇİNİZ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: Text('Gıda Atığı'),
                    value: _isFoodWasteSelected,
                    onChanged: (bool value) {
                      setState(() {
                        _isFoodWasteSelected = value;
                      });
                    },
                    activeColor: Color(0xff71a17c),
                  ),
                  if (_isFoodWasteSelected)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Atık miktarı seçin (kg)'),
                        ),
                        Slider(
                          value: _foodWasteAmount,
                          activeColor: Color(0xff71a17c),
                          inactiveColor: Colors.black,
                          divisions: 50,
                          max: 50,
                          min: 0,
                          label: _foodWasteAmount.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _foodWasteAmount = value;
                            });
                          },
                        ),
                      ],
                    ),
                  SwitchListTile(
                    title: Text('Yağ Atığı'),
                    value: _isOilWasteSelected,
                    onChanged: (bool value) {
                      setState(() {
                        _isOilWasteSelected = value;
                      });
                    },
                    activeColor: Color(0xff71a17c),
                  ),
                  if (_isOilWasteSelected)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Atık miktarı seçin (L)'),
                        ),
                        Slider(
                          value: _oilWasteAmount,
                          activeColor: Color(0xff71a17c),
                          inactiveColor: Colors.black,
                          divisions: 50,
                          max: 50,
                          min: 0,
                          label: _oilWasteAmount.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _oilWasteAmount = value;
                            });
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_isFoodWasteSelected) {
                        Map<String, dynamic> foodWaste = {
                          'Tarih': DateTime.now().toString(),
                          'Atık Türü': 'Gıda',
                          'Miktar': '$_foodWasteAmount kg',
                          'Durumu': 'İletildi'
                        };
                        widget.selectedWastes.add(foodWaste);
                        _saveWasteToFirestore(foodWaste);
                      }
                      if (_isOilWasteSelected) {
                        Map<String, dynamic> oilWaste = {
                          'Tarih': DateTime.now().toString(),
                          'Atık Türü': 'Yağ',
                          'Miktar': '$_oilWasteAmount L',
                          'Durumu': 'İletildi'
                        };
                        widget.selectedWastes.add(oilWaste);
                        _saveWasteToFirestore(oilWaste);
                      }
                      widget.onWastesUpdated(widget.selectedWastes);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Atık bilgileri gönderildi!'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Kapat',
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                    },
                    child: Text('GÖNDER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff286650),
                      foregroundColor: Colors.white,
                    ),
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
