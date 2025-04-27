import 'package:flutter/material.dart';
import 'package:library_app/profil.dart';
import 'package:library_app/welcome.dart';
import 'package:library_app/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LibraryHomePage(), 
    );
  }
}
