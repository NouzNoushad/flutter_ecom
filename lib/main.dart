import 'package:flutter/material.dart';
import 'package:flutter_ecom/cart.dart';
import 'package:flutter_ecom/details.dart';
import 'package:flutter_ecom/home.dart';
import 'package:flutter_ecom/products.dart';
import 'package:flutter_ecom/profile.dart';
import 'package:flutter_ecom/sign_up.dart';
import 'package:flutter_ecom/wishlist.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
