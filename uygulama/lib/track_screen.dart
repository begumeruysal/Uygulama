import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DataTable(
              columns: const [
                DataColumn(label: Text('Tarih')),
                DataColumn(label: Text('Atık Türü')),
                DataColumn(label: Text('Durumu')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('20.06.2024')),
                  DataCell(Text('Gıda')),
                  DataCell(Text('İletildi')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15.06.2024')),
                  DataCell(Text('Gıda')),
                  DataCell(Text('Alındı')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10.06.2024')),
                  DataCell(Text('Yağ')),
                  DataCell(Text('Alındı')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
