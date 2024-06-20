import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isFoodWasteSelected = false;
  bool isOilWasteSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Atık Türü Seçiniz',
              ),
            ),
            SwitchListTile(
              title: const Text('Gıda Atığı'),
              value: isFoodWasteSelected,
              onChanged: (bool value) {
                setState(() {
                  isFoodWasteSelected = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Yağ Atığı'),
              value: isOilWasteSelected,
              onChanged: (bool value) {
                setState(() {
                  isOilWasteSelected = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submit action here
              },
              child: const Text('İLET'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
