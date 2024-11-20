import 'package:flutter/material.dart';
import 'main.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({super.key});
  static int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('All Customers'),
      ),
      body: ListView.builder(
        itemCount: InvoiceApp.invoices.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            onTap: () {
              selectedIndex = index;
              Navigator.pushNamed(context, '/details_page');
            },
            tileColor: Colors.blue[100],
            leading: Text(
              InvoiceApp.invoices[index].name,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
