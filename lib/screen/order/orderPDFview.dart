import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class OrderPDFView extends StatelessWidget {
  final String url;  
  OrderPDFView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: SfPdfViewer.network(url),
    );
  }
}