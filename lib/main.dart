import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';

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
              onPressed: () {},
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
