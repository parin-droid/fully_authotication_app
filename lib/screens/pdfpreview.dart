import 'package:flutter/material.dart';
import 'package:fully_authotication_app/providers/create_pdf.dart';
import 'package:fully_authotication_app/screens/next_screen.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoice invoice;
  const PdfPreviewPage({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(build: (context) => CreatePdf().createPdf(invoice)),
    );
  }
}
