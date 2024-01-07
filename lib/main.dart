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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const  Color.fromRGBO(250, 238, 209, 1),
        appBarTheme:AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
          color: const Color.fromRGBO(96, 114, 116, 1),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Word Wizard",
              style: TextStyle(
                fontWeight:FontWeight.bold),
            )
          )
        ),
        body: sayfalar[secilenIndex],
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.rocket),label: 'Gözden Geçir'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Ayarlar'),
        ]),
        )
    );
  }
}