
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested({@required this.city});

  @override
  List<Object> get props => [city];
}
