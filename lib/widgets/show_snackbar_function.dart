import 'package:calcapp/res/strings.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(Strings.resolveRedIssues, textAlign: TextAlign.center),
    ),
  );
}