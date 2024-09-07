// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pdfWidgets;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';

import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// class PdfCreate extends StatelessWidget {
//   const PdfCreate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final pdf = pdfWidgets.Document();
//     return pdf.addPage(pdfWidgets.Page(build: (context) {
//       return pdfWidgets.Center(child: pdfWidgets.Text("Hello World"));
//     },),);
//     final pdfFile = pdf.save();

//     await Printing.layoutPdf(onLayout: (format) => pdfFile,);
//     );

//   },

// }

Future<Uint8List> _generatePdf(String title) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80,
      build: (context) {
        return pw.Column(
            children: [pw.Text("Luiz Pedero"), pw.Text("Tempo de voces")]);
      },
    ),
  );
  return pdf.save();
}
