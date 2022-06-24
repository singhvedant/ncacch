import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var _count = 0;
  void incrementCounter() {
    _count += 1;
  }
}
