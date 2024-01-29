import 'package:flutter/material.dart';

class DropdownSelectionProvider extends ChangeNotifier {
  List<String?> _selectedItems = List.filled(13, null);

  List<String?> get selectedItems => _selectedItems;

  void updateSelectedItem(int index, String? newValue) {
    _selectedItems[index] = newValue;
    notifyListeners();
  }
}
