import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/weather/model/weather.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'data.dart';

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  static const String cityKey = "city";
  static const String conditionKey = "condition";

  final FlutterSecureStorage flutterSecureStorage = Modular.get<FlutterSecureStorage>();

  @override
  Future<Weather> readWeather({@required String city}) async {
    var t = await flutterSecureStorage.read(key: city);
    var temp = t != null ? double.parse(t) : null;
    return temp != null ? Weather(temperature: temp) : null;
  }

  @override
  Future<void> writeWeather({@required String city, @required double temperature}) async {
    await flutterSecureStorage.write(key: city, value: temperature.toString());
  }
}
