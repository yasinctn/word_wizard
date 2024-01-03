import 'package:flutter/material.dart';
import 'package:word_wizard/Screens/KelimeSecScreen.dart';
import 'package:word_wizard/Screens/OyunSecScreen.dart';
import 'package:word_wizard/Screens/kategori_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KategoriWidget(),
    );
  }
}
