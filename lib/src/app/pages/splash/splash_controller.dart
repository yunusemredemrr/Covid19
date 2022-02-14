// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, invalid_use_of_visible_for_overriding_member, invalid_override_of_non_virtual_member

import 'package:covid19/src/app/pages/auth/auth_view.dart';
import 'package:covid19/src/app/pages/home/home_view.dart';
import 'package:covid19/src/app/pages/splash/splash_presenter.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/repositories/country_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashController extends Controller {
  final SplashPresenter _presenter;

  SplashController(
    CountryRepository _countryRepository,
  ) : _presenter = SplashPresenter(
          _countryRepository,
        );

  List<Country>? countries;
  bool isLanguagesIsFetched = false;

  @override
  void onInitState() async {
    _presenter.getCountry();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCountryOnNext = (List<Country> response) {
      if (response.isNotEmpty)
        Future.delayed(Duration(seconds: 2)).then((value) =>
            Navigator.pushReplacement(
                getContext(),
                CupertinoPageRoute(
                    builder: (context) => HomeView(response.first))));
      else
        Future.delayed(Duration(seconds: 2)).then((value) =>
            Navigator.pushReplacement(getContext(),
                CupertinoPageRoute(builder: (context) => AuthView())));

      refreshUI();
    };

    _presenter.getCountryOnError = (e) {};
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
