import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resistance_calculator_app/core/base/base_view_model.dart';
import 'package:resistance_calculator_app/core/providers.dart';

class HomeViewModel extends BaseViewModel {
  MainProvider _mainProvider;

  void onInit(BuildContext context) {
    print('Entra');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _mainProvider = Provider.of<MainProvider>(context, listen: false);
      if (_mainProvider.locale == 'es') {
        changeLanguages = 'es';
        print(languages);
      } else {
        changeLanguages = 'en';
        print(languages);
      }
      changeloader = false;
    });
    // changeloader = false;
  }

  bool _loader = true;
  final List<String> _languages = ['Español', 'Ingles'];

  List<String> get languages => _languages;
  bool get loader => _loader;

  set changeLanguages(String language) {
    _languages.clear();
    if (language == 'es') {
      languages.addAll(['Español', 'Ingles']);
    } else {
      languages.addAll(['Spanish', 'English']);
    }
    notifyListeners();
  }

  set changeloader(bool value) {
    _loader = value;
    notifyListeners();
  }
}
