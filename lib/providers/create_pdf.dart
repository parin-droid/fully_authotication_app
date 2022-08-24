import 'dart:typed_data';

import 'package:fully_authotication_app/screens/next_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class CreatePdf {
  Future<Uint8List> createPdf(Invoice invoice) async {
    final pdf = Document();
    pdf.addPage(Page(
        build: (context) => Column(children: [
              Text("Invoice",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 20),
              Row(children: [
                Text("Customer :"),
                SizedBox(width: 5),
                Text(invoice.customer)
              ]),
              SizedBox(height: 10),
              Row(children: [
                Text("Address :"),
                SizedBox(width: 5),
                Text(invoice.address)
              ]),
              SizedBox(height: 50),
              Table(border: TableBorder.all(color: PdfColors.black), children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Invoice for Payment",
                        textAlign: TextAlign.center),
                  ),
                ]),
                ...invoice.item.map((e) => TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(e.description),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("\$ ${e.cost}")),
                    ])),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("TAX", textAlign: TextAlign.right),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("\$ ${(invoice.totalCost() * 0.1)}",
                        textAlign: TextAlign.left),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("TOTAL", textAlign: TextAlign.right),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("\$ ${invoice.totalCost()}",
                        textAlign: TextAlign.left),
                  ),
                ]),
              ]),
              SizedBox(height: 30),
              Text("THANK YOU FOR YOUR BUSINESS"),
            ])));
    return pdf.save();
  }
}
