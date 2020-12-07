import 'package:flutter_app_template/weather/data/data.dart';
import 'package:flutter_app_template/weather/data/weather_repository_impl.dart';
import 'package:flutter_app_template/weather/ui/weather_route.dart';
import 'package:flutter_app_template/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WeatherModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<Bloc>((i) => WeatherBloc()),
        Bind<WeatherRepository>((i) => WeatherRepositoryImpl()),
        Bind<WeatherLocalDataSource>((i) => WeatherLocalDataSourceImpl()),
        Bind<WeatherRemoteDataSource>((i) => WeatherRemoteDataSourceImpl())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => WeatherRoute()),
      ];
}
