import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../home/repository/home_repository.dart';
import '../home/models/covid_data_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;
  _HomeControllerBase(this.repository);

  @observable
  List<int> februaryInfo = [];
  @observable
  List<int> marchInfo = [];
  @observable
  List<int> aprilInfo = [];
  @observable
  List<int> mayInfo = [];
  @observable
  List<int> juneInfo = [];

  CovidData _februaryCovidData = CovidData();
  CovidData _marchCovidData = CovidData();
  CovidData _aprilCovidData = CovidData();
  CovidData _mayCovidData = CovidData();
  CovidData _juneCovidData = CovidData();

  @action
  getMonthsInfo() async {
    await _getCountryDataForBrazilInMonths();
    februaryInfo = _getMonthInfo(_februaryCovidData);
    marchInfo = _getMonthInfo(_marchCovidData);
    aprilInfo = _getMonthInfo(_aprilCovidData);
    mayInfo = _getMonthInfo(_mayCovidData);
    juneInfo = _getMonthInfo(_juneCovidData);
  }

  _getCountryDataForBrazilInMonths() async {
    var today = DateTime.now();
    _februaryCovidData =
        await repository.getDataFromBrazil(dateForRequest: '20200229');
    _marchCovidData =
        await repository.getDataFromBrazil(dateForRequest: '20200330');
    _aprilCovidData =
        await repository.getDataFromBrazil(dateForRequest: '20200430');
    _mayCovidData =
        await repository.getDataFromBrazil(dateForRequest: '20200530');
    _juneCovidData = await repository.getDataFromBrazil(
        dateForRequest: DateFormat("yyyyMMdd")
            .format(DateTime(today.year, today.month, today.day - 1)));
  }

  List<int> _getMonthInfo(CovidData monthData) {
    return [
      _getCasesInfoFromSpecificDate(monthData),
      _getDeathsInfoFromSpecificDate(monthData)
    ];
  }

  int _getCasesInfoFromSpecificDate(CovidData monthData) {
    int totalCases = 0;
    for (int index = 0; index < monthData.data.length; index++) {
      totalCases += monthData.data[index].cases;
    }
    return totalCases;
  }

  int _getDeathsInfoFromSpecificDate(CovidData monthData) {
    int totalDeaths = 0;
    for (int index = 0; index < monthData.data.length; index++) {
      totalDeaths += monthData.data[index].deaths;
    }
    return totalDeaths;
  }
}
