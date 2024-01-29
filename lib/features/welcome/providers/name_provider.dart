import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String _enteredName = '';

  String get enteredName => _enteredName;

  void setEnteredName(String name) {
    _enteredName = name;
    notifyListeners();
  }
}
