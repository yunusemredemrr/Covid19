// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_overrides, invalid_use_of_visible_for_overriding_member

import 'package:covid19/src/app/pages/home/home_view.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'auth_presenter.dart';

class AuthController extends Controller {
  final AuthPresenter _presenter;

  AuthController(
    CountryRepository _countryRepository,
  ) : _presenter = AuthPresenter(
          _countryRepository,
        );

  final GlobalKey dropdownMenuKey = GlobalKey();
  bool isDropDownMenuOpen = false;

  String? country;
  List<Country>? countries;

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.setCountryTypeOnNext = (Country? country) {
      countries = [country!];
      if (country != null)
        Future.delayed(Duration.zero).then(
          (value) => Navigator.pushAndRemoveUntil(
            getContext(),
            MaterialPageRoute(
              builder: (context) => HomeView(country),
            ),
            (Route<dynamic> route) => false,
          ),
        );
    };

    _presenter.setCountryTypeOnError = (e) {};
  }

  void onDropDownContainerTapped() {
    isDropDownMenuOpen = !isDropDownMenuOpen;
    refreshUI();
  }

  void setTitle(String value) {
    country = value;
    onDropDownContainerTapped();

    refreshUI();
  }

  void onLogInButtonPressed() async {
    if (country != null) {
      _presenter.setCountry(Country(country: country));
    }
  }
}
