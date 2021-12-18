import 'package:flutter/material.dart';

class ColorBandModel {
  ColorBandModel({
    this.name,
    this.color,
    this.value,
    this.valueMultiplier,
    this.identifier,
  });

  String name;
  Color color;
  int value;
  int valueMultiplier;
  String identifier;

  ColorBandModel copyWith(
          {String name,
          Color color,
          int value,
          int valueMultiplier,
          String identifier}) =>
      ColorBandModel(
        name: name ?? this.name,
        color: color ?? this.color,
        value: value ?? this.value,
        valueMultiplier: valueMultiplier ?? this.valueMultiplier,
        identifier: identifier ?? this.identifier,
      );
}
