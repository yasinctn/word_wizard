import 'package:word_wizard/list_item.dart';

class KelimeListesi{
  static Map<String,String> liste={
    "football":"futbol",
    "basketball":"basketbol",
    "volleyball":"voleybol",
    "tennis":"tenis",
    "boxing":"boks",
    "archery":"okçuluk",
    "weighlifting":"halter",
    "wrestling":"güreş",
    "handball":"hentbol",
    "javelin throw":"cirit atma",
  };

  static List<String> turkceler=[];
  static List<String> ingilizceler=[];
  static List<ListItem>turkcelerItems=[];
  static List<ListItem>ingilizcelerItems=[];

  static void turkcelerOlustur()
  {
    turkceler=liste.values.toList();
    turkceler.shuffle();

    turkcelerItems=[
      ListItem(text:turkceler[0]),
      ListItem(text:turkceler[1]),
      ListItem(text:turkceler[2]),
      ListItem(text:turkceler[3]),
      ListItem(text:turkceler[4]),
      ListItem(text:turkceler[5]),
      ListItem(text:turkceler[6]),
      ListItem(text:turkceler[7]),
      ListItem(text:turkceler[8]),
      ListItem(text:turkceler[9]),
    ];
  }

  static void ingilizcelerOlustur()
  {
    ingilizceler=liste.keys.toList();
    ingilizceler.shuffle();

    ingilizcelerItems=[
      ListItem(text:ingilizceler[0]),
      ListItem(text:ingilizceler[1]),
      ListItem(text:ingilizceler[2]),
      ListItem(text:ingilizceler[3]),
      ListItem(text:ingilizceler[4]),
      ListItem(text:ingilizceler[5]),
      ListItem(text:ingilizceler[6]),
      ListItem(text:ingilizceler[7]),
      ListItem(text:ingilizceler[8]),
      ListItem(text:ingilizceler[9]),
    ];
  }

  static void ingilizceBilgisiAta()
  {
    for(int i=0;i<ingilizcelerItems.length;i++)
    {
      ingilizcelerItems[i].englishDefine();
      turkcelerItems[i].englishDefine();
    }
  }
}