import 'package:flutter/material.dart';
import 'package:word_wizard/Models/kategoriler.dart';
import 'package:word_wizard/Models/kelime.dart';

class GozdenGecir extends StatefulWidget {
  GozdenGecir({super.key});

  @override
  State<GozdenGecir> createState() => stateGozdenGecir();
}

// ignore: camel_case_types
class stateGozdenGecir extends State<GozdenGecir> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Kelime> kelimeler = Kategoriler.ogrenilenDondur();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListView.builder(
                          itemCount: kelimeler.length,
                          itemBuilder: (context, index) {
                return ListTile(
                  title: Text(kelimeler[index].ingilizce),
                  subtitle: Text(kelimeler[index].turkce),
                );
                          }),
              ),
            /*  ContainerWidget(
                  text: "Gözden Geçir:"),
              //   ContainerWidget(text: "Hatalar"),
              //  ContainerWidget(text: "Öğrenilen Kelime Sayısı:")*/
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    List<Kelime> kelimeler = [];
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(201, 134, 137, 125).withOpacity(0.2),
              spreadRadius: 7,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          //color: Colors.amber
        ),
        width: 250,
        height: 100,
        child: ListView.builder(
            itemCount: kelimeler.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(kelimeler[index].ingilizce),
                subtitle: Text(kelimeler[index].turkce),
              );
            }),
      ),
    );
  }
}
