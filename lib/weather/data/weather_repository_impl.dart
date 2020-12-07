import 'package:flutter/material.dart';
import 'package:flutter_app_template/weather/data/data.dart';
import 'package:flutter_app_template/weather/data/weather_local_data_source.dart';
import 'package:flutter_app_template/weather/data/weather_repository.dart';
import 'package:flutter_app_template/weather/model/weather.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherLocalDataSource _weatherLocalDataSource = Modular.get<WeatherLocalDataSource>();
  WeatherRemoteDataSource _weatherRemoteDataSource = Modular.get<WeatherRemoteDataSource>();

  ///The repository implementation is responsible to obtain data from either a local source
  ///or a remote source, other methods can be written to update the local source with the
  ///latest values of temperature
  @override
  Future<Weather> getWeather({@required String city}) async {
    Weather weather = await _weatherLocalDataSource.readWeather(city: city);

    if (weather == null) {
      var json = await _weatherRemoteDataSource.getWeather(city);
      weather = Weather.fromJson(json);
      _weatherLocalDataSource.writeWeather(city: city, temperature: weather.temperature);
    }

    return weather;
  }
}
