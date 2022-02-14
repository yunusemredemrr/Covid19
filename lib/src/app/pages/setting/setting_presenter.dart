import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:covid19/src/domain/repositories/covid19_repository.dart';
import 'package:covid19/src/domain/usecases/update_country.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SettingPeresenter extends Presenter {
  final UpdateCountry _updateCountry;

  SettingPeresenter(CountryRepository _countryRepository)
      : _updateCountry = UpdateCountry(_countryRepository);

  late Function updateCountryOnNext;
  late Function updateCountryOnError;

  void updateCountry(Country country, int id) {
    _updateCountry.execute(
      _UpdateCountryObserver(this),
      UpdateCountryParams(country, id),
    );
  }

  @override
  void dispose() {
    _updateCountry.dispose();
  }
}

class _UpdateCountryObserver extends Observer<Country> {
  final SettingPeresenter _peresenter;

  _UpdateCountryObserver(this._peresenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _peresenter.updateCountryOnError(e);
  }

  @override
  void onNext(Country? response) {
    _peresenter.updateCountryOnNext(response);
  }
}
