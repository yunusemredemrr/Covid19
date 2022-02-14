// ignore_for_file: avoid_print

import 'dart:async';

import 'package:covid19/src/domain/entities/covid19.dart';
import 'package:covid19/src/domain/repositories/covid19_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCovid19Data extends UseCase<List<Covid19>, GetCovid19DataParams> {
  final Covid19Repository _covid19repository;

  GetCovid19Data(this._covid19repository);

  @override
  Future<Stream<List<Covid19>>> buildUseCaseStream(
      GetCovid19DataParams? params) async {
    StreamController<List<Covid19>> controller = StreamController();
    try {
      List<Covid19> covid19Data =
          await _covid19repository.getCovid19Data(params!.country);
      controller.add(covid19Data);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class GetCovid19DataParams {
  final String country;
  GetCovid19DataParams(this.country);
}
