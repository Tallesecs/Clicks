import '../home/widgets/fl_chart.dart';
import '../../shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Charts'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CovidChart(
                maxCases: controller.juneInfo[0],
                ),
          ),
          FlatButton(
            child: Text('try to get data'),
            onPressed: () {
              // controller.getMonthsInfo();
              print(controller.februaryInfo);
              print(controller.marchInfo);
              print(controller.aprilInfo);
              print(controller.mayInfo);
              print(controller.juneInfo);
            },
          ),
        ],
      ),
    );
  }
}
