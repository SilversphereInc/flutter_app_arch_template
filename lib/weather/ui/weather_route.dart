import 'package:flutter/material.dart';
import 'package:flutter_app_template/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WeatherRoute extends StatelessWidget implements Disposable {
  final WeatherBloc _weatherBloc = Modular.get<WeatherBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        cubit: _weatherBloc,
        builder: (context, state) {
          if (state is WeatherInitial) {
            _weatherBloc.add(WeatherRequested(city: "Miami"));
          } else if (state is WeatherLoadFailure) {
            return Container(
              color: Colors.red,
              child: Center(
                child: Text("Failed to loading weather in Miami"),
              ),
            );
          } else if (state is WeatherLoadSuccess) {
            return Container(
              color: Colors.green,
              child: Center(
                child: Text("Current temperature in Miami ${state.weather.temperature}"),
              ),
            );
          } else if (state is WeatherLoadFailure) {}
          return Container(
            color: Colors.blue,
            child: Center(
              child: Text("Loading weather in Miami"),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.close();
  }
}
