// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:covid19/src/app/pages/home/home_presenter.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/entities/covid19.dart';
import 'package:covid19/src/domain/repositories/covid19_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;
  final Country country;

  HomeController(Covid19Repository _covid19Repository, this.country)
      : _presenter = HomePresenter(
          _covid19Repository,
        );

  List<Covid19>? covid19Data;
  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  @override
  void onInitState() {
    _presenter.getCovid19Data(country.country!);
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCovid19DataOnNext = (List<Covid19>? response) async {
      covid19Data = response;
      refreshUI();
    };
    _presenter.getCovid19DataOnError = (e) {};
  }
}
