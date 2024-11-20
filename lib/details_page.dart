import 'package:flutter/material.dart';
import 'package:invoice_app_json/invoices_list.dart';
import 'main.dart';

class DetailsPage extends StatelessWidget {
  
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(InvoiceApp.invoices[InvoicesList.selectedIndex].name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice No: ${InvoiceApp.invoices[InvoicesList.selectedIndex].id}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Products:',
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          Text(
            InvoiceApp.invoices[InvoicesList.selectedIndex].toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
