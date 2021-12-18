import 'package:flutter/material.dart';
import 'package:resistance_calculator_app/core/base/base_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resistance_calculator_app/core/models/color_band_model.dart';

class HomeViewModel extends BaseViewModel {
  // Number of bands selected
  int _numberBands = 4;
  // List of colorBands showed in AlertDialog
  final List<ColorBandModel> _listColorBands = [];
  // List of bands selected
  final List<ColorBandModel> _listBandSelected = [
    ColorBandModel(),
    ColorBandModel()
  ];
  // ColorBandModel used to make multiplier item
  ColorBandModel _multiplier = ColorBandModel();
  // Resistance value
  String _resistanceValue = '';

  // Getters
  int get numberBands => _numberBands;
  List<ColorBandModel> get listColorBands => _listColorBands;
  List<ColorBandModel> get listBandSelected => _listBandSelected;
  ColorBandModel get multiplier => _multiplier;
  String get resistanceValue => _resistanceValue;

  // Fill list of color bands with info in local language and more info
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

  // Setters
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

  // Function to calculate the resistance
  void calculateResistance() {
    // If number of bands is equal to 4
    if (numberBands == 4) {
      // If value needed isn't empty
      if (listBandSelected[0].name == null ||
          listBandSelected[1].name == null ||
          multiplier.name == null) {
        // If is empty the resistanceValue is empty
        resistanceValue = '';
      } else {
        // Concat the values of bands selected
        String bandsValue = listBandSelected[0].value.toString() +
            listBandSelected[1].value.toString();
        // Function to format the resistance
        _formatResistance(bandsValue);
      }
    } else {
      // If number bands is equal to 5
      // Validate empty values
      if (listBandSelected[0].name == null ||
          listBandSelected[1].name == null ||
          listBandSelected[2].name == null ||
          multiplier.name == null) {
        // If values needed are null the resistanceValue is empty
        resistanceValue = '';
      } else {
        // Concat the value of bands
        String bandsValue = listBandSelected[0].value.toString() +
            listBandSelected[1].value.toString() +
            listBandSelected[2].value.toString();
        // Function to format the resistance
        _formatResistance(bandsValue);
      }
    }
  }

  void _formatResistance(String bandsValue) {
    // If any value of multiplier name is Gold or Silved or Oro or Plata we need to divide the bandsValue by the valueMultiplier
    if (multiplier.name == 'Gold' ||
        multiplier.name == 'Silver' ||
        multiplier.name == 'Oro' ||
        multiplier.name == 'Plata') {
      // Getting the resistance
      double resistance = int.parse(bandsValue) / multiplier.valueMultiplier;
      // Asign the resistanceValue
      resistanceValue = resistance.toString();
    } else {
      // In this part, we need to  multiplicate the bands value and the value returned from calculateValuemultiplier function
      int resistance = int.parse(bandsValue) * calculateValueMultiplier();
      // We need to know what value identifier is nedded, this solve when we count the number of characters in resistance value
      // We need to divide the resistance by the 1000, 1000000 or 1000000000
      if (resistance.toString().length >= 4 &&
          resistance.toString().length <= 6) {
        resistanceValue = (resistance / 1000).toString() + 'K';
      } else if (resistance.toString().length >= 7 &&
          resistance.toString().length <= 9) {
        resistanceValue = (resistance / 1000000).toString() + 'M';
      } else if (resistance.toString().length >= 7 &&
          resistance.toString().length >= 10) {
        resistanceValue = (resistance / 1000000000).toString() + 'G';
      } else {
        resistanceValue = resistance.toInt().toString();
      }
    }
  }

  // Function to calculate the value of multipler
  int calculateValueMultiplier() {
    if (multiplier.identifier == 'K') {
      return multiplier.valueMultiplier * 1000;
    } else if (multiplier.identifier == 'M') {
      return multiplier.valueMultiplier * 1000000;
    } else if (multiplier.identifier == 'G') {
      return multiplier.valueMultiplier * 1000000000;
    } else {
      return multiplier.valueMultiplier;
    }
  }

  // this is the setter, but to simplify things we opted for receive to values, the index of array and ColorBandModel.
  void changeBandSelected(int index, ColorBandModel value) {
    listBandSelected[index] = value;
    notifyListeners();
  }

  // This function is called in HomeView to fill the list of band colors
  void onInit(BuildContext context) {
    fillColorBands(context);
  }
}
