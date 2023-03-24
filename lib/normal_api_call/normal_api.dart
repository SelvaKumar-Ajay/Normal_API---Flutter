import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Normal_Api extends StatefulWidget {
  const Normal_Api({super.key});

  @override
  State<Normal_Api> createState() => Normal_ApiState();
}

class Normal_ApiState extends State<Normal_Api> {
  List products = [];
  bool loading = true;

  getProduct() async {
    String url = 'https://api.escuelajs.co/api/v1/users';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      setState(() {
        products = json.decode(responce.body);
      });
      loading = false;
      // print(products);
    }
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  TextStyle style =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                products[index]["name"],
                style: style,
              ),
              leading:
                  CircleAvatar(child: Image.network(products[index]["avatar"])),
              subtitle: Text(products[index]["email"]),
              trailing: Text(products[index]["id"].toString()),
            ),
          );
  }
}
