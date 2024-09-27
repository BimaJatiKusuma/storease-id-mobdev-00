import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"), // Use widget.title_list to access the passed title
      ),
      body: Center(
        child: Text("Belum ada Riwayat Pembelian"),
      )
    );
  }
}