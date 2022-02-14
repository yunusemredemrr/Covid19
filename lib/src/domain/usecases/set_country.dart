import 'dart:async';

import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SetCountry extends UseCase<Country, SetCountryParams> {
  final CountryRepository _countryRepository;

  SetCountry(this._countryRepository);

  @override
  Future<Stream<Country>> buildUseCaseStream(SetCountryParams? params) async {
    StreamController<Country> controller = StreamController();
    try {
      Country country = await _countryRepository.setCountry(params!.country);
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

class SetCountryParams {
  final Country country;

  SetCountryParams(this.country);
}
