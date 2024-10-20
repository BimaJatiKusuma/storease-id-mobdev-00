import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class OrderPDFView extends StatelessWidget {
  final String title;
  final String url;  
  OrderPDFView({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SfPdfViewer.network(url),
    );
  }
}