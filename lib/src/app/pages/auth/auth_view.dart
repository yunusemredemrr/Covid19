// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:covid19/src/app/constants/constants.dart';
import 'package:covid19/src/app/widgets/default_button.dart';
import 'package:covid19/src/app/widgets/dropdown_container.dart';
import 'package:covid19/src/app/widgets/dropdown_menu.dart';
import 'package:covid19/src/data/repositories/data_country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'auth_controller.dart';

class AuthView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _AuthViewState(AuthController(
      DataCountryRepository(),
    ));
  }
}

class _AuthViewState extends ViewState<AuthView, AuthController> {
  _AuthViewState(AuthController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      key: globalKey,
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: size.width,
                        height: size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: padding.top + 50),
                            Container(
                              width: 150,
                              child: Image(
                                image: AssetImage("assets/images/logo.png"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: size.width - 60,
                              child: Text(
                                "Covid19",
                                style: kLargeTitleStyle(kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 15),
                            ControlledWidgetBuilder<AuthController>(
                              builder: (context, controller) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1,
                                          color: kBlack.withOpacity(0.2))),
                                  key: controller.dropdownMenuKey,
                                  margin: EdgeInsets.symmetric(horizontal: 70),
                                  child: DropdownContainer(
                                    isOpen: controller.isDropDownMenuOpen,
                                    onTap: controller.onDropDownContainerTapped,
                                    selectedText: controller.country,
                                    textStyle: controller.country != null
                                        ? kHintTextStyle(kBlack)
                                        : kHintTextStyle(kGrey),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 50),
                            ControlledWidgetBuilder<AuthController>(
                              builder: (context, controller) {
                                return Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.symmetric(horizontal: 70),
                                  child: DefaultButton(
                                      onPressed: controller.country != null
                                          ? controller.onLogInButtonPressed
                                          : null,
                                      text: "Continue",
                                      color: controller.country != null
                                          ? kPrimaryColor
                                          : kDisabledButtonColor),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ControlledWidgetBuilder<AuthController>(
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
                  left: 70,
                  right: 70,
                  list: kCountries,
                  onOutsideTap: controller.onDropDownContainerTapped,
                  selectedText: controller.country,
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
