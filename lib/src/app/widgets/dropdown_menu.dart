// ignore_for_file: prefer_const_constructors

import 'package:covid19/src/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'default_progress_indicator.dart';

class DropdownMenu extends StatelessWidget {
  final List<String>? list;
  final String? selectedText;
  final Function() onOutsideTap;
  final Function(String selectedText) onItemTap;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final bool isContentStyle;

  DropdownMenu({
    required this.list,
    required this.onOutsideTap,
    required this.selectedText,
    required this.onItemTap,
    required this.isContentStyle,
    this.right,
    this.left,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            width: size.width,
            height: size.height,
            color: kBlack.withOpacity(0.01),
          ),
          onTap: onOutsideTap,
        ),
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: list == null
              ? Container(
                  alignment: Alignment.center,
                  height: 207,
                  decoration: BoxDecoration(
                    color: kBackGroundColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: DefaultProgressIndicator(color: kPrimaryColor),
                )
              : Container(
                  constraints: BoxConstraints(maxHeight: 207),
                  decoration: BoxDecoration(
                    color: kBackGroundColor,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: kPrimaryColor, width: 1),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < list!.length; i++)
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              color: selectedText == list![i]
                                  ? Color(0xFFF2F2F2)
                                  : kBackGroundColor,
                              width: size.width,
                              height: 41,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 18,
                                ),
                                child: Text(
                                  list![i],
                                  style: isContentStyle
                                      ? kContentStyleThin(
                                          selectedText == list![i]
                                              ? kPrimaryColor
                                              : kBlack,
                                        )
                                      : kHintTextStyle(
                                          selectedText == list![i]
                                              ? kPrimaryColor
                                              : kBlack,
                                        ),
                                ),
                              ),
                            ),
                            onTap: () {
                              onItemTap(list![i]);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
