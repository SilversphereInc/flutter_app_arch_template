import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/app/app_widget.dart';
import 'package:flutter_app_template/weather/weather_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModule extends MainModule {
  ///All dependencies binds here,are accessible to every other module
  ///this decencies live during the whole application life cycle.
  @override
  List<Bind> get binds => [
        Bind((i) => FlutterSecureStorage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", module: WeatherModule()),
      ];
}
