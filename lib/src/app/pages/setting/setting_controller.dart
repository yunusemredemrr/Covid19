import 'package:covid19/src/app/pages/setting/setting_presenter.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SettingController extends Controller {
  final SettingPeresenter _presenter;
  Country country;
  bool isDropDownMenuOpen = false;
  final GlobalKey dropdownMenuKey = GlobalKey();
  String? countryString;

  SettingController(CountryRepository _countryRepository, this.country)
      : _presenter = SettingPeresenter(_countryRepository);

  @override
  void initListeners() {
    _presenter.updateCountryOnNext = (Country response) {
      country = response;
      refreshUI();
    };
    _presenter.updateCountryOnError = (e) {};
  }

  void onDropDownContainerTapped() {
    isDropDownMenuOpen = !isDropDownMenuOpen;
    refreshUI();
  }

  void updateCountry() async {
    _presenter.updateCountry(
        Country(country: countryString, id: country.id!), country.id!);
  }

  void setTitle(String value) {
    countryString = value;
    onDropDownContainerTapped();

    refreshUI();
  }
}
