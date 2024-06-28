import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WasteTrackingResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedWastes;
  final String userId;

  WasteTrackingResultsPage({required this.selectedWastes, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Atık Takip Sonuçları',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .collection('waste')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('Atık verisi bulunamadı'));
                }

                final wastes = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: wastes.length,
                  itemBuilder: (context, index) {
                    final waste = wastes[index];
                    final wasteData = waste.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(wasteData['Atık Türü'] ?? 'N/A'),
                      subtitle: Text(wasteData['Miktar'] ?? 'N/A'),
                      trailing: Text(wasteData['Durumu'] ?? 'N/A'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
