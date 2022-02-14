// ignore_for_file: avoid_print

import 'dart:async';

import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UpdateCountry extends UseCase<Country, UpdateCountryParams> {
  final CountryRepository _countryRepository;
  UpdateCountry(this._countryRepository);
  @override
  Future<Stream<Country?>> buildUseCaseStream(
      UpdateCountryParams? params) async {
    StreamController<Country> controller = StreamController();
    try {
      Country country =
          await _countryRepository.updateCountry(params!.id, params.country);
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

class UpdateCountryParams {
  final Country country;
  final int id;

  UpdateCountryParams(this.country, this.id);
}
