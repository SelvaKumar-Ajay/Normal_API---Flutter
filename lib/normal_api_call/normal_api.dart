import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class normal_Api extends StatefulWidget {
  const normal_Api({super.key});

  @override
  State<normal_Api> createState() => _normal_ApiState();
}

class _normal_ApiState extends State<normal_Api> {
  List products = [];

  getProduct() async {
    String url = 'https://api.escuelajs.co/api/v1/products';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      setState(() {
        products = json.decode(responce.body);
      });
      // print(products);
    }
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index]["title"]),
      ),
    );
  }
}
