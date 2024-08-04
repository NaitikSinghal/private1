import 'package:flutter/cupertino.dart';

class LanguageData{
  String l1;
  String l2;
  String l3;
  LanguageData.items({
    required this.l1,
    required this.l2,
    required this.l3,
});
}

List<LanguageData> languageItems =[

  LanguageData.items(l1: 'हिंदी', l2: 'HINDI', l3: 'आ'),
  LanguageData.items(l1: 'English', l2: 'ENGLISH', l3: 'A'),
  LanguageData.items(l1: 'ಕನ್ನಡ', l2: 'KANNADA', l3: 'ಎ'),
  LanguageData.items(l1: 'मराठी', l2: 'MARATHI', l3: 'अ'),
  
];