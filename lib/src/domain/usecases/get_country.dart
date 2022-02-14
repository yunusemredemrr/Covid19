// ignore_for_file: avoid_print

import 'dart:async';

import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCountry extends UseCase<List<Country>, void> {
  final CountryRepository _countryRepository;
  GetCountry(this._countryRepository);
  @override
  Future<Stream<List<Country>>> buildUseCaseStream(void params) async {
    StreamController<List<Country>> controller = StreamController();
    try {
      List<Country> country = await _countryRepository.getCountry();
      controller.add(country);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}
