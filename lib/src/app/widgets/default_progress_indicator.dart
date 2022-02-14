// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:io';

import 'package:covid19/src/app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  final Color color;

  DefaultProgressIndicator({this.color = kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(radius: 15)
          : CircularProgressIndicator(color: color),
    );
  }
}
