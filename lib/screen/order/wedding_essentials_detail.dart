import 'package:flutter/material.dart';

class WeddingEssentialsDetail extends StatefulWidget {
  @override
  State<WeddingEssentialsDetail> createState() =>
      _WeddingEssentialsDetailState();
}

class _WeddingEssentialsDetailState extends State<WeddingEssentialsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Persiapan Pernikahan'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Assignments Section
              Text(
                'Proposal Kerja Sama Vendor (Last update: 05-01-2024 14.00 WIB)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  assignmentCard(
                      'Vendor Dekorasi'),
                  assignmentCard('Vendor Catering'),
                  assignmentCard(
                      'Vendor Venue'),
                  assignmentCard(
                      'Vendor MUA'),
                  assignmentCard(
                      'Vendor Fotografi'),
                ],
              ),
              SizedBox(height: 16),
              // Point Histories Section
              Text(
                'Perisiapan Akhir (Last update: 02-01-2024 13.00 WIB)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  pointCard('-', 'Periapan venue lokasi'),
                  pointCard('-', 'Penyediaan gaun pengantin laki'),
                  pointCard('-', 'Penyediaan gaun pengantin perempuan'),
                  pointCard('-', 'Food Test catering'),
                  pointCard('-', 'Briefing Master Ceremony'),
                  pointCard('-', 'Gladi bersih'),
                ],
              ),
            ],
          ),
        ));
  }
}

// Widget to create assignment card
Widget assignmentCard(String title) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading: Icon(Icons.check_circle, color: Colors.green),
      title: Text(title),
    ),
  );
}

// Widget to create point card
Widget pointCard(String points, String title) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading: Text(points,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      title: Text(title),
    ),
  );
}
