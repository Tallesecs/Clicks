import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covid_charts/app/app_widget.dart';
import 'package:covid_charts/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
