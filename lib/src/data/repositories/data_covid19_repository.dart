import 'dart:convert';

import 'package:covid19/src/data/repositories/data_covid19_base_repository.dart';
import 'package:covid19/src/domain/entities/covid19.dart';
import 'package:covid19/src/domain/repositories/covid19_base_repository.dart';
import 'package:covid19/src/domain/repositories/covid19_repository.dart';
import 'package:http/http.dart';

class DataCovid19Repository implements Covid19Repository {
  static final _instance = DataCovid19Repository._internal();
  DataCovid19Repository._internal()
      : _localDbRepository = DataCovid19BaseRepository();
  factory DataCovid19Repository() => _instance;
  final Covid19BaseRepository _localDbRepository;
  @override
  Future<List<Covid19>> getCovid19Data(country) async {
    Response response =
        await _localDbRepository.executeCovid19Request("GET", country);
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((covidData) => Covid19.fromJson(covidData))
        .toList();
  }
}
