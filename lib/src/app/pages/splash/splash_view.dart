// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, no_logic_in_create_state

import 'package:covid19/src/app/pages/splash/splash_controller.dart';
import 'package:covid19/src/data/repositories/data_country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashView extends View {
  @override
  State<StatefulWidget> createState() {
    return _SplashViewState(
      SplashController(
        DataCountryRepository(),
      ),
    );
  }
}

class _SplashViewState extends ViewState<SplashView, SplashController> {
  _SplashViewState(SplashController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 30),
                    child: HeartbeatProgressIndicator(
                      duration: Duration(milliseconds: 1400),
                      child: Image(image: AssetImage("assets/images/logo.png")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
