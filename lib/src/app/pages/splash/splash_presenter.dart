import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:covid19/src/domain/usecases/get_country.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashPresenter extends Presenter {
  late Function getCountryOnNext;
  late Function getCountryOnError;

  final GetCountry _getCountries;

  SplashPresenter(
    CountryRepository countryRepository,
  ) : _getCountries = GetCountry(countryRepository);

  void getCountry() {
    _getCountries.execute(_GetCountryObserver(this));
  }

  @override
  void dispose() {
    _getCountries.dispose();
  }
}

class _GetCountryObserver extends Observer<List<Country>> {
  final SplashPresenter _presenter;

  _GetCountryObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getCountryOnError(e);
  }

  @override
  void onNext(List<Country>? response) {
    _presenter.getCountryOnNext(response);
  }
}
