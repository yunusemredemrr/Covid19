import 'package:covid19/src/domain/entities/covid19.dart';

abstract class Covid19Repository {
  Future<List<Covid19>> getCovid19Data(country);
}
