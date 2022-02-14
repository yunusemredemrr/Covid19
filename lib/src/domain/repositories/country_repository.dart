import 'package:covid19/src/domain/entities/country.dart';

abstract class CountryRepository {
  Future<Country> setCountry(Country country);
  Future<void> deleteCountry(int countryID);
  Future<Country> updateCountry(int countryID, Country country);
  Future<List<Country>> getCountry();
}
