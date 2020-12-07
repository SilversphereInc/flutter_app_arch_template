import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/weather/model/weather.dart';

abstract class WeatherLocalDataSource {
  Future<Weather> readWeather({@required String city});
  Future<void> writeWeather({@required String city, @required double temperature});
}
