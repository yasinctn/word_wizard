import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:word_wizard/Screens/KelimeBilgisiScreen.dart';
=======
import 'package:word_wizard/Screens/KelimeOgren.dart';
>>>>>>> 5c7f6b47ec8646e2a8d321b7a4b028d8bb6192e3
import 'package:word_wizard/Screens/KelimeSecScreen.dart';
import 'package:word_wizard/Screens/my_home_page.dart';

class OyunSecScreen extends StatelessWidget {
  int secilenKategoriIndex = 0;
  OyunSecScreen({super.key, required this.secilenKategoriIndex});

// NAVİGASYON FONKSİYONU
  void navigateTo(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }

// KULLANICI ARAYÜZÜ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oyun Seçimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      navigateTo(
                        context,
                        KelimeBilgisi(
                            secilenKategoriIndex: secilenKategoriIndex
                            ),
                      );
                    },
                    child: const Text(
                      'Kelime Bilgisi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      navigateTo(
                        context,
                        KelimeSecScreen(
                            secilenKategoriIndex: secilenKategoriIndex),
                      );
                    },
                    child: const Text(
                      'Kelime Seç',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyHomePage(secilenKategoriIndex,)),);
                    },
                    child: const Text(
                      'Kelime Eşleştir',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // navigate to kelime yaz screen
                    },
                    child: const Text(
                      'Kelime Yaz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 180,
              height: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                          builder: (context) => InputPage(secilenKategoriIndex,)),);
                    },
                child: const Text(
                  'Resim Seç',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
