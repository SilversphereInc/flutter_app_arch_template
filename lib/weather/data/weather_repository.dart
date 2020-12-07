import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/weather/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather({@required String city});
}
