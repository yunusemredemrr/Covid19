// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid19/src/app/constants/constants.dart';
import 'package:covid19/src/app/pages/home/home_view.dart';
import 'package:covid19/src/app/pages/setting/setting_controller.dart';
import 'package:covid19/src/app/widgets/default_app_bar.dart';
import 'package:covid19/src/app/widgets/dropdown_container.dart';
import 'package:covid19/src/app/widgets/dropdown_menu.dart';
import 'package:covid19/src/data/repositories/data_country_repository.dart';
import 'package:covid19/src/domain/entities/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SettingView extends View {
  Country _country;
  SettingView(this._country);
  @override
  State<StatefulWidget> createState() {
    return _SettingViewState(
      SettingController(
        DataCountryRepository(),
        _country,
      ),
    );
  }
}

class _SettingViewState extends ViewState<SettingView, SettingController> {
  _SettingViewState(SettingController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      backgroundColor: kGrey,
      body: Stack(
        children: [
          Container(
            height: 300,
            color: kWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultAppBar(
                  leadingIcon: Icon(
                    Icons.close,
                    color: kWhite,
                  ),
                  actionIcon: null,
                  leadingOnPressed: () {
                    Navigator.pop(context);
                  },
                  actionOnPressed: () {},
                  backgroundColor: kPrimaryColor,
                  titleColor: kWhite,
                  title: "SETTINGS",
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ControlledWidgetBuilder<SettingController>(
                          builder: (context, controller) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1,
                                      color: kBlack.withOpacity(0.2))),
                              key: controller.dropdownMenuKey,
                              margin: EdgeInsets.only(left: 10, right: 50),
                              child: DropdownContainer(
                                isOpen: controller.isDropDownMenuOpen,
                                onTap: controller.onDropDownContainerTapped,
                                selectedText: controller.countryString,
                                textStyle: controller.countryString != null
                                    ? kHintTextStyle(kBlack)
                                    : kHintTextStyle(kGrey),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ControlledWidgetBuilder<SettingController>(
                  builder: (context, controller) {
                    return InkWell(
                      onTap: () {
                        controller.updateCountry();
                        Future.delayed(Duration(milliseconds: 500), () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  HomeView(controller.country),
                            ),
                            (route) => false,
                          );
                        });
                      },
                      child: Container(
                        width: mSize(context).width / 3,
                        height: 58,
                        decoration: BoxDecoration(
                          color: kSuccessColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "SAVE ALL",
                            style: TextStyle(
                              fontSize: 20,
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mPadding(context).bottom + 20,
                ),
              ],
            ),
          ),
          ControlledWidgetBuilder<SettingController>(
            builder: (context, controller) {
              if (!controller.isDropDownMenuOpen) {
                return Container();
              } else {
                final RenderBox? renderBox = controller
                    .dropdownMenuKey.currentContext!
                    .findRenderObject() as RenderBox?;
                final offset = renderBox!.localToGlobal(Offset.zero);

                return DropdownMenu(
                  top: offset.dy + 56,
                  left: 10,
                  right: 50,
                  list: kCountries,
                  onOutsideTap: controller.onDropDownContainerTapped,
                  selectedText: controller.countryString,
                  onItemTap: controller.setTitle,
                  isContentStyle: false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
