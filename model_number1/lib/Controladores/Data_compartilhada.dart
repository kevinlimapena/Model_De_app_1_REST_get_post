import 'package:flutter/material.dart';

class Appcontroller extends ChangeNotifier {
  static Appcontroller instance = Appcontroller();
  

  bool isdarttheme = false;
  changeTheme(){
    isdarttheme = !isdarttheme;
    notifyListeners();
  }
}