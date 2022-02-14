// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:math' as math;

import 'package:covid19/src/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropdownContainer extends StatelessWidget {
  final String? selectedText;
  final String? hintText;
  final bool isOpen;
  final Function() onTap;
  final double height;
  final TextStyle textStyle;
  final double leftPadding;

  DropdownContainer({
    required this.isOpen,
    required this.onTap,
    required this.textStyle,
    this.selectedText,
    this.hintText,
    this.height = 41.0,
    this.leftPadding = 18,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(3),
          border: isOpen
              ? Border.all(color: kPrimaryColor, width: 2)
              : Border.all(
                  color: kWhite,
                  width: 2,
                ),
        ),
        width: size.width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: leftPadding,
              ),
              child: Text(
                selectedText ?? hintText ?? "Select Your Country",
                style: textStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 14),
              child: !isOpen
                  ? SvgPicture.asset(
                      'assets/icons/arrow_down.svg',
                      color: kPrimaryColor,
                      width: 10.52,
                    )
                  : Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_down.svg',
                        color: kPrimaryColor,
                        width: 10.52,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
