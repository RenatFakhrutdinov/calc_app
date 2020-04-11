import 'package:calcapp/screens/native_module_plot_page.dart';
import 'package:calcapp/screens/wolfram_alpha_plot_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void toWolframAlphaPlotPage(BuildContext context,
      {String mathExpression, num from, num to}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WolframAlphaPlotPage(
          mathExpression: mathExpression,
          from: from,
          to: to,
        ),
      ),
    );
  }

  static void toNativeModulePlotPage(BuildContext context,
      {String mathExpression, num from, num to}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NativeModulePlotPage(
          mathExpression: mathExpression,
          from: from,
          to: to,
        ),
      ),
    );
  }
}
