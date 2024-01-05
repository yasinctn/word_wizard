import 'package:flutter/material.dart';
import 'package:word_wizard/Models/kategoriler.dart';
import 'package:word_wizard/Screens/KelimeBilgisiScreen.dart';
import 'package:word_wizard/Screens/OyunSecScreen.dart';

class KategoriWidget extends StatefulWidget {
  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
  const KategoriWidget({super.key});
}

class _KategoriWidgetState extends State<KategoriWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Kategoriler.kategoriDoldur();
      if (mounted) {
        setState(() {});
      }
    });
  }

  void kategoriGuncelle() {
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /*  ElevatedButton(child: Text("Write to file"),onPressed: (){
            DosyaIslem.writeToFile();
            }
            ),
            ElevatedButton(child: Text("Progress Azalt"), onPressed: (){
              Kategoriler.progressAzalt();
            },),*/
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: Kategoriler.kategoriler.length,
                itemBuilder: (context, index) => Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () async{
                        await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => OyunSecScreen(secilenKategoriIndex: index,)),);
                          kategoriGuncelle();
                    },
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${Kategoriler.kategoriler[index].isim.toLowerCase()}.png',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Kategoriler.kategoriler[index].isim),
                                  Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            "${Kategoriler.kategoriler[index].ogrenilenKelime}/${Kategoriler.kategoriler[index].toplamKelime}"),
                                        Text('Kelimeler')
                                      ],
                                    ),
                                  )),
                                  Container(
                                    height: 10,
                                    width: 300,
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.circular(10),
                                        value: Kategoriler.kategoriler[index]
                                            .progressHesapla(),
                                        backgroundColor: const Color.fromARGB(
                                            255, 222, 219, 219),
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                            Colors.green),
                                      ),
                                    ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
