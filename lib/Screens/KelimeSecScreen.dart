import 'dart:math';
import 'package:flutter/material.dart';
import 'package:word_wizard/Models/kategoriler.dart';
import 'package:word_wizard/Models/kelime.dart';

final class KelimeSecScreen extends StatefulWidget {
  int secilenKategoriIndex = 0;
  KelimeSecScreen({super.key, required this.secilenKategoriIndex});

  @override
  State<KelimeSecScreen> createState() => KelimeSecScreenState();
}

final class KelimeSecScreenState extends State<KelimeSecScreen> {
// DEĞİŞKENLER

  List<Kelime> words = Kategoriler.kategoriler[2].kelimeListesi;
  List<Question> seenWords = [];
  double progress = 0.0;
  bool isCorrect = false;
  Kelime? correctWord;
  List<Kelime> options = [];
  String imagePath = "";
  Color buttonColor1 = Colors.blue;
  Color buttonColor2 = Colors.blue;
  int index = 0;

// RASTGELE KELİME ALMA METHODU
  Kelime? generateRandomWord() {
    if (words.isNotEmpty) {
      Kelime generatedAnsver = words[Random().nextInt(words.length)];
      words = List.from(words)..remove(generatedAnsver);
      return generatedAnsver;
    } else {
      return null;
    }
  }

// YANLIŞ SEÇENEKLERİ OLUŞTURMA FONKSİYONU
  Kelime generateUncorrectWord(Kelime correctAnsver) {
    List<Kelime> otherWords = List.from(
        Kategoriler.kategoriler[widget.secilenKategoriIndex].kelimeListesi)
      ..remove(correctAnsver);
    return otherWords[Random().nextInt(otherWords.length)];
  }

// SORU OLUŞTURMA FONKSİYONU
  void generateQuestion() {
    index += 1;
    correctWord = generateRandomWord();
    if (correctWord != null) {
      imagePath = "assets/images/${correctWord!.ingilizce}.jpeg";
      options = [correctWord!, generateUncorrectWord(correctWord!)];
      var newQuestion = Question(word: correctWord, options: options);
      seenWords.add(newQuestion);
    } else {
      print("nul geldi");
    }
    options.shuffle();
  }

  void nextWord() {
    if (index + 1 < seenWords.length) {
      index += 1;
      setState(() {
        correctWord = seenWords[index].word;
        imagePath = "assets/images/${correctWord!.ingilizce}.jpeg";
        options = seenWords[index].options;
      });
    } else {
      setState(() {
        generateQuestion();
      });
    }
  }

  void prevWord() {
    if (index > 0) {
      index -= 1;
      setState(() {
        correctWord = seenWords[index].word;
        imagePath = "assets/images/${correctWord!.ingilizce}.jpeg";
        options = seenWords[index].options;
      });
    } else {
      print("önceki soru yok");
    }
  }

// CEVAP KONTROL FONKSİYONU
  bool checkAnswer(Kelime selectedWord) {
    if (selectedWord.ingilizce == correctWord!.ingilizce) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

// KULLANICI ARAYÜZÜ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kelime Seç',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
// PROGRESS
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: (index + 1) / 10,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
// GERİ
                IconButton(
                  onPressed: (() => prevWord()),
                  icon: const Icon(Icons.arrow_back_ios),
                  style: const ButtonStyle(
                    alignment: Alignment.centerLeft,
                  ),
                ),
// RESİM
                Image(
                  image: AssetImage(imagePath),
                  width: 250,
                  height: 250,
                ),
// İLERİ
                IconButton(
                  onPressed: (() => nextWord()),
                  icon: const Icon(Icons.arrow_forward_ios),
                  style: const ButtonStyle(
                    alignment: Alignment.centerRight,
                  ),
                ),
                const Spacer()
              ],
            ),
            const SizedBox(height: 20),
// SEÇENEKLER
            // 1. SEÇENEK BUTONU
            const Spacer(),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(buttonColor1),
                ),
                child: Text(options.first.ingilizce),
                onPressed: () {
                  if (checkAnswer(options.first)) {
                    setState(() {
                      buttonColor1 = Colors.green;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(() {
                            buttonColor1 = Colors.blue;
                            nextWord();
                          });
                        },
                      );
                    });
                  } else {
                    setState(() {
                      buttonColor1 = Colors.red;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(() {
                            buttonColor1 = Colors.blue;
                          });
                        },
                      );
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
// 2. SEÇENEK BUTONU
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(buttonColor2),
                  ),
                  child: Text(options.last.ingilizce),
                  onPressed: () {
                    if (checkAnswer(options.last)) {
                      setState(() {
                        buttonColor2 = Colors.green;
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            setState(() {
                              buttonColor2 = Colors.blue;
                              nextWord();
                            });
                          },
                        );
                      });
                    } else {
                      setState(() {
                        buttonColor2 = Colors.red;
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            setState(() {
                              buttonColor2 = Colors.blue;
                            });
                          },
                        );
                      });
                    }
                  }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// KELİME MODELİ
/*
class Kelime {
  String ing;
  String tr;
  String imagePath;

  Kelime({required this.ing, required this.tr, required this.imagePath});
}
*/
class Question {
  Kelime? word;
  List<Kelime> options;

  Question({required this.word, required this.options});
}

/*
// MEYVELER LİSTESİ
class Fruits {
  static List<Kelime> fruits = [
    Kelime(ing: "Apple", tr: "Elma", imagePath: "assets/apple.jpg"),
    Kelime(ing: "Banana", tr: "Muz", imagePath: "assets/banana.jpg"),
    Kelime(ing: "Cherry", tr: "Kiraz", imagePath: "assets/cherry.jpg"),
    Kelime(ing: "Grape", tr: "Üzüm", imagePath: "assets/grape.jpg"),
    Kelime(ing: "Orange", tr: "Portakal", imagePath: "assets/orange.jpg"),
    Kelime(ing: "Pineapple", tr: "Ananas", imagePath: "assets/pineapple.jpg"),
    Kelime(ing: "Strawberry", tr: "Çilek", imagePath: "assets/strawberry.jpg"),
    Kelime(ing: "Watermelon", tr: "Karpuz", imagePath: "assets/watermelon.jpg"),
    Kelime(
        ing: "Tangerine", tr: "Mandalina", imagePath: "assets/tangerine.jpg"),
    Kelime(
        ing: "Blackberry", tr: "Böğürtlen", imagePath: "assets/blackberry.jpg")
  ];
}
*/
showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: Text("Bitir"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Tekrar Oyna"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Tebrikler"),
    content: Text("Tüm kelimeleri tamamladınız"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
