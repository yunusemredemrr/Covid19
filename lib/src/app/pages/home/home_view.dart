// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

import 'package:covid19/src/app/constants/constants.dart';
import 'package:covid19/src/app/pages/auth/auth_view.dart';
import 'package:covid19/src/app/pages/home/home_controller.dart';
import 'package:covid19/src/app/pages/setting/setting_view.dart';
import 'package:covid19/src/app/widgets/default_app_bar.dart';
import 'package:covid19/src/data/repositories/data_covid19_repository.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:covid19/src/domain/entities/covid19.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends View {
  Country country;
  HomeView(this.country);
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController(
      DataCovid19Repository(),
      country,
    ));
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingView(widget.country),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(Icons.settings),
        backgroundColor: kSuccessColor,
      ),
      backgroundColor: kBackGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultAppBar(
            leadingIcon: null,
            actionIcon: null,
            leadingOnPressed: () {},
            actionOnPressed: () {},
            backgroundColor: kPrimaryColor,
            titleColor: kWhite,
            title: "Covid19",
          ),
          SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ControlledWidgetBuilder<HomeController>(
                    builder: (context, controller) {
                      if (controller.covid19Data != null) {
                        return Column(
                          children: [
                            Container(
                              child: controller.covid19Data!.last.date!
                                              .substring(0, 10) ==
                                          controller.today
                                              .toString()
                                              .substring(0, 10) ||
                                      controller.covid19Data!.last.date!
                                              .substring(0, 10) ==
                                          controller.yesterday
                                              .toString()
                                              .substring(0, 10)
                                  ? Container(
                                      width: mSize(context).width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: mSize(context).width / 20,
                                          vertical: mSize(context).height / 30),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            controller
                                                .covid19Data!.last.country!
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Text(
                                                "Cases: ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                  controller
                                                      .covid19Data!.last.cases!
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Date: ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                  controller
                                                      .covid19Data!.last.date!
                                                      .substring(0, 10)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ),
                            Center(
                              child: SfCartesianChart(
                                title: ChartTitle(text: 'Covid19 Data'),
                                backgroundColor: kWhite,
                                borderColor: kPrimaryColor,
                                borderWidth: 2,
                                crosshairBehavior: CrosshairBehavior(
                                  enable: true,
                                  activationMode: ActivationMode.singleTap,
                                  shouldAlwaysShow: true,
                                ),
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries<Covid19, String>>[
                                  LineSeries<Covid19, String>(
                                    dataSource: controller.covid19Data!,
                                    xValueMapper: (Covid19 covid19, _) =>
                                        covid19.date!.substring(0, 10),
                                    yValueMapper: (Covid19 covid19, _) =>
                                        covid19.cases,
                                    color: kErrorTextColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: mPadding(context).bottom,
          )
        ],
      ),
    );
  }
}
