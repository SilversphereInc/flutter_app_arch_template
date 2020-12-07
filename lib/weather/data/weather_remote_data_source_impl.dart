import 'data.dart';

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  @override
  Future<Map> getWeather(String city) async {
    await Future.delayed(Duration(seconds: 5)); //Simulate a network call of 5 seconds duration
    return {"temperature": 75.0};
  }
}
