import 'package:word_wizard/Models/kelime.dart';

class Kategori {
  String isim;
  double progress;
  List<bool> oyunlar = [false, true, false, false, false];
  int toplamKelime;
  int ogrenilenKelime;
  List<Kelime> kelimeListesi = [];
  Kategori(this.isim, this.progress, this.ogrenilenKelime, this.toplamKelime);

  double progressHesapla() {
    double progress = 0.0;
    for (var oyun in this.oyunlar) {
      if (oyun) {
        progress += 0.2;
      }
    }
    return progress;
  }
}
