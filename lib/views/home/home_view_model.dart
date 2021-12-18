import 'package:flutter/material.dart';
import 'package:resistance_calculator_app/core/base/base_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resistance_calculator_app/core/models/color_band_model.dart';

class HomeViewModel extends BaseViewModel {
  // final List<String> _languages = ['Español', 'Ingles'];
  int _numberBands = 4;
  final List<ColorBandModel> _listColorBands = [];
  final List<ColorBandModel> _listBandSelected = [
    ColorBandModel(),
    ColorBandModel()
  ];
  ColorBandModel _multiplier = ColorBandModel();

  String _resistanceValue = '';

  // List<String> get languages => _languages;
  int get numberBands => _numberBands;
  List<ColorBandModel> get listColorBands => _listColorBands;
  List<ColorBandModel> get listBandSelected => _listBandSelected;
  ColorBandModel get multiplier => _multiplier;
  String get resistanceValue => _resistanceValue;

  // void changeLanguages(String language, BuildContext context) {
  //   _languages.clear();
  //   if (language == 'es') {
  //     languages.addAll(['Español', 'Ingles']);
  //   } else {
  //     languages.addAll(['Spanish', 'English']);
  //   }
  //   notifyListeners();
  // }

  void fillColorBands(BuildContext context) {
    listColorBands.addAll([
      ColorBandModel(
          name: AppLocalizations.of(context).black,
          color: Colors.black,
          value: 0,
          valueMultiplier: 1,
          identifier: null),
      ColorBandModel(
          name: AppLocalizations.of(context).brown,
          color: Colors.brown,
          value: 1,
          valueMultiplier: 10,
          identifier: null),
      ColorBandModel(
          name: AppLocalizations.of(context).red,
          color: Colors.red,
          value: 2,
          valueMultiplier: 100,
          identifier: null),
      ColorBandModel(
          name: AppLocalizations.of(context).orange,
          color: Colors.orange,
          value: 3,
          valueMultiplier: 1,
          identifier: 'K'),
      ColorBandModel(
          name: AppLocalizations.of(context).yellow,
          color: Colors.yellow[700],
          value: 4,
          valueMultiplier: 10,
          identifier: 'K'),
      ColorBandModel(
          name: AppLocalizations.of(context).green,
          color: Colors.green,
          value: 5,
          valueMultiplier: 100,
          identifier: 'K'),
      ColorBandModel(
          name: AppLocalizations.of(context).blue,
          color: Colors.blue,
          value: 6,
          valueMultiplier: 1,
          identifier: 'M'),
      ColorBandModel(
          name: AppLocalizations.of(context).violet,
          color: Colors.purple,
          value: 7,
          valueMultiplier: 10,
          identifier: 'M'),
      ColorBandModel(
          name: AppLocalizations.of(context).grey,
          color: Colors.grey,
          value: 8,
          valueMultiplier: 100,
          identifier: 'M'),
      ColorBandModel(
          name: AppLocalizations.of(context).white,
          color: Colors.white,
          value: 9,
          valueMultiplier: 1,
          identifier: 'G'),
      ColorBandModel(
          name: AppLocalizations.of(context).gold,
          color: Colors.yellowAccent[700],
          value: 10,
          valueMultiplier: 10,
          identifier: null),
      ColorBandModel(
          name: AppLocalizations.of(context).silver,
          color: Colors.grey[400],
          value: 11,
          valueMultiplier: 100,
          identifier: null),
    ]);
  }

  set numberBands(int value) {
    _numberBands = value;
    notifyListeners();
  }

  set multiplier(ColorBandModel value) {
    _multiplier = value;
    notifyListeners();
  }

  set resistanceValue(String value) {
    _resistanceValue = value;
    notifyListeners();
  }

  void calculateResistance() {
    if (numberBands == 4) {
      if (listBandSelected[0].name == null ||
          listBandSelected[1].name == null ||
          multiplier.name == null) {
        resistanceValue = '';
      } else {
        print('Calculando el multiplier');
        print(calculateValueMultiplier());
        // CalculateResistance
        String bandsValue = listBandSelected[0].value.toString() +
            listBandSelected[1].value.toString();
        if (multiplier.name == 'Gold' ||
            multiplier.name == 'Silver' ||
            multiplier.name == 'Oro' ||
            multiplier.name == 'Plata') {
          double resistance =
              int.parse(bandsValue) / multiplier.valueMultiplier;
          print('Esta es la resistencia cuando sleeccionan oro o plata');
          print(resistance.toString());
        } else {
          int resistance = int.parse(bandsValue) * calculateValueMultiplier();
          if (resistance.toString().length >= 4 &&
              resistance.toString().length <= 6) {
            print('La resistencia es: ' + (resistance / 1000).toString() + 'K');
          } else if (resistance.toString().length >= 7 &&
              resistance.toString().length <= 9) {
            print('La resistencia es: ' +
                (resistance / 1000000).toString() +
                'M');
          } else if (resistance.toString().length >= 7 &&
              resistance.toString().length >= 10) {
            print('La resistencia es: ' +
                (resistance / 1000000000).toString() +
                'G');
          } else {
            print('La resistencia es: ' + resistance.toInt().toString());
          }
        }

        // return Text(
        //   'El valor de la resistencia es: \n' + vM.resistanceValue,
        //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        // );
      }
    }
    //  else {
    //   if (vM.listBandSelected[0].name == null ||
    //       vM.listBandSelected[1].name == null ||
    //       vM.listBandSelected[2].name == null ||
    //       vM.multiplier.name == null) {
    //     return Container();
    //   } else {
    //     return Text(
    //       'El valor de la resistencia es: \n' + vM.resistanceValue,
    //       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //     );
    //   }
    // }
    // }
  }

  int calculateValueMultiplier() {
    if (multiplier.identifier == 'K') {
      return multiplier.valueMultiplier * 1000;
    } else if (multiplier.identifier == 'M') {
      return multiplier.valueMultiplier * 1000 * 1000;
    } else if (multiplier.identifier == 'G') {
      return multiplier.valueMultiplier * 1000 * 1000 * 1000;
    } else {
      return multiplier.valueMultiplier;
    }
  }

  void changeBandSelected(int index, ColorBandModel value) {
    listBandSelected[index] = value;
    notifyListeners();
  }

  void onInit(BuildContext context) {
    fillColorBands(context);
  }
}
