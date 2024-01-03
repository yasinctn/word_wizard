import 'package:flutter/material.dart';
import 'package:word_wizard/Screens/kategori_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sayfalar = [KategoriWidget()/*0,GozdenGecir(),Ayarlar()*/];
    int secilenIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Word Wizard"))),
        body: sayfalar[0],
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.rocket),label: 'Gozden Gecir'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Ayarlar'),
        ]),
        )
    );
  }
}