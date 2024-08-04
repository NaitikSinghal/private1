import 'package:flutter/foundation.dart';

class PhoneNumberProvider with ChangeNotifier {
  String phoneNumber = '';
  String get number => phoneNumber;

  void setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }
}
