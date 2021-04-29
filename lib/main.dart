import 'package:flutter/material.dart';
import 'package:alisveris_liste/AlisverisListe/Alisveris_Listesi_Sayfası.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: AlisverisListesiSayfasi(),
    );
  }
}
