import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_app_json/main.dart';
import 'invoice.dart';

Future<List<Invoice>> fetchInvoices() async {
  var response = await http.get(Uri.parse('https://www.jsonkeeper.com/b/TT8U'));
  if (response.statusCode == 200) {
    var jsonArr = jsonDecode(response.body)['invoices'] as List;
    return jsonArr.map((e) => Invoice.fromJson(e)).toList();
  }
  return [];
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInvoices().then((onValue) {
      InvoiceApp.invoices = onValue;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitPouringHourGlass(
          duration: Duration(
            milliseconds: 1000,
          ),
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
