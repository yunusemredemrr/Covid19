import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:covid19/src/domain/usecases/set_country.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AuthPresenter extends Presenter {
  late Function setCountryTypeOnNext;
  late Function setCountryTypeOnError;

  final SetCountry _setCountry;

  AuthPresenter(
    CountryRepository _countryRepository,
  ) : _setCountry = SetCountry(_countryRepository);

  void setCountry(Country country) {
    _setCountry.execute(
      _SetCountryObserver(this),
      SetCountryParams(country),
    );
  }

  @override
  void dispose() {
    _setCountry.dispose();
  }
}

class _SetCountryObserver extends Observer<Country> {
  final AuthPresenter _presenter;

  _SetCountryObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.setCountryTypeOnError(e);
  }

  @override
  void onNext(Country? response) {
    _presenter.setCountryTypeOnNext(response);
  }
}
