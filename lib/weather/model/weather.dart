import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Weather extends Equatable {
  final double temperature;

  const Weather({
    @required this.temperature,
  });

  @override
  List<Object> get props => [temperature];

  factory Weather.fromJson(Map json) {
    var temp = json["temperature"];
    return Weather(temperature: temp);
  }
}
