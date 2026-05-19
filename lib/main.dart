import "package:flutter/material.dart";
import "package:flutter_application_2/daftar.dart"; // ← tambahin ; saja

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Daftar()  // tetap Daftar
    );
  }
}