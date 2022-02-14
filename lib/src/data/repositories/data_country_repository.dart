// ignore_for_file: prefer_const_declarations, avoid_print

import 'dart:async';

import 'package:covid19/src/data/repositories/data_local_db_repository.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:covid19/src/domain/repositories/local_db_repository.dart';

class DataCountryRepository implements CountryRepository {
  static final _instance = DataCountryRepository._internal();
  DataCountryRepository._internal()
      : _localDbRepository = DataLocalDBRepository();
  factory DataCountryRepository() => _instance;
  final LocalDBRepository _localDbRepository;

  @override
  Future<Country> setCountry(Country country) async {
    try {
      int id = await _localDbRepository.setDatabase("country", country.toMap());
      return Country(country: country.country, id: id);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<List<Country>> getCountry() async {
    try {
      final result = await _localDbRepository.getDatabase("country");
      return result.map((json) => Country.fromMap(json)).toList();
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> deleteCountry(int countryID) async {
    try {
      await _localDbRepository.deleteRowFromDatabase(
        "country",
        countryID,
      );
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<Country> updateCountry(int countryID, Country country) async {
    try {
      int id = await _localDbRepository.updateRowFromDatabase(
          "country", countryID, country.toMap());
      return Country(country: country.country, id: id);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
