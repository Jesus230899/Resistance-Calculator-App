import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resistance_calculator_app/core/base/base_view_model.dart';
import 'package:resistance_calculator_app/core/providers.dart';

class HomeViewModel extends BaseViewModel {
  int _counter;

  HomeViewModel({int counter = 0}) : this._counter = counter;

  int get counter => this._counter;
  set counter(int value) {
    this._counter = value;
    notifyListeners();
  }

  void changeLanguage(BuildContext context) {
    // print(Provider.of<MainProvider>(context).locale);
  }
}
