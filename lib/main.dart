import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFGenerator(),
    );
  }
}

class PDFGenerator extends StatefulWidget {
  @override
  _PDFGeneratorState createState() => _PDFGeneratorState();
}

class _PDFGeneratorState extends State<PDFGenerator> {
  final pdf = pw.Document();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to PDF Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              maxLines: 10,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Text(textController.text); // Center
      })); 
      final output = await getExternalStorageDirectory();
      print(output);
    final file = File('${output?.path}/myPDF${Random().nextInt(10) + 100}.pdf');
    await file.writeAsBytes(await pdf.save());
              },
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
