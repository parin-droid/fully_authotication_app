import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fully_authotication_app/screens/view_details.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  List<Invoice> partyInvoice = [
    Invoice("Parin", "Ahmedabad", [
      ItemList("Coffee", 220.00),
      ItemList("Tea", 180.00),
      ItemList("Water", 50.00),
      ItemList("Bottle", 540.00),
    ]),
    Invoice("Pruthvi", "Ahmedabad", [
      ItemList("Coffee", 250.00),
      ItemList("Tea", 180.00),
      ItemList("Water", 50.00),
      ItemList("Bottle", 200.00),
    ]),
    Invoice("Parth", "Surat", [
      ItemList("Coffee", 430.00),
      ItemList("Tea", 330.00),
      ItemList("Water", 50.00),
      ItemList("Bottle", 300.00),
    ]),
    Invoice("Jainesh", "Mumbai", [
      ItemList("Coffee", 450.00),
      ItemList("Tea", 330.00),
      ItemList("Water", 220.00),
      ItemList("Bottle", 1100.00),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: partyInvoice.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(partyInvoice[index].customer),
                      subtitle: Text(partyInvoice[index].address),
                      trailing: Text("\₹ ${partyInvoice[index].totalCost()}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewDetails(invoice: partyInvoice[index])));
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Invoice {
  final String customer;
  final String address;
  final List<ItemList> item;

  Invoice(this.customer, this.address, this.item);

  double totalCost() {
    return item.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class ItemList {
  final String description;
  final double cost;

  ItemList(this.description, this.cost);
}
