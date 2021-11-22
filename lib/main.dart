// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'view/cart_list_view.dart';
import 'view/product_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => ProductListView(),
        "/cart": (BuildContext context) => CartListView()
      },
      initialRoute: "/",
    );
  }
}
