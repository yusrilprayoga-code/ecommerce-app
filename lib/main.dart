import 'package:ecommerce_app/providers/cartProduct.dart';
import 'package:ecommerce_app/sign/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

String cart = 'cart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CartProduct>(CartProductAdapter());
  await Hive.openBox<CartProduct>(cart);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
