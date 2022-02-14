import 'package:covid19/src/domain/entities/covid19.dart';
import 'package:covid19/src/domain/repositories/covid19_repository.dart';
import 'package:covid19/src/domain/usecases/get_covid19_data.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late Function getCovid19DataOnNext;
  late Function getCovid19DataOnError;

  final GetCovid19Data _getCovid19Data;

  HomePresenter(Covid19Repository _covid19Repository)
      : _getCovid19Data = GetCovid19Data(_covid19Repository);

  void getCovid19Data(String country) {
    _getCovid19Data.execute(
      _GetCovid19DataObserver(this),
      GetCovid19DataParams(country),
    );
  }

  @override
  void dispose() {
    _getCovid19Data.dispose();
  }
}

class _GetCovid19DataObserver extends Observer<List<Covid19>> {
  final HomePresenter _presenter;
  _GetCovid19DataObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getCovid19DataOnError(e);
  }

  @override
  void onNext(List<Covid19>? response) {
    _presenter.getCovid19DataOnNext(response);
  }
}
