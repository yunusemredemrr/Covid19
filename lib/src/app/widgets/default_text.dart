import 'package:covid19/src/app/constants/constants.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  DefaultText({
    Key? key,
    required this.text,
    this.size = 18,
    this.textColor = kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }
}
