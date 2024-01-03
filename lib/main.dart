import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:word_wizard/Screens/KelimeSecScreen.dart';
import 'package:word_wizard/Screens/OyunSecScreen.dart';
=======
>>>>>>> 5c7f6b47ec8646e2a8d321b7a4b028d8bb6192e3
import 'package:word_wizard/Screens/kategori_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      home: KategoriWidget(),
=======
    List<Widget> sayfalar = [KategoriWidget()/*0,GozdenGecir(),Ayarlar()*/];
    int secilenIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Word Wizard"))),
        body: sayfalar[0],
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.rocket),label: 'Gözden Geçir'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Ayarlar'),
        ]),
        )
>>>>>>> 5c7f6b47ec8646e2a8d321b7a4b028d8bb6192e3
    );
  }
}