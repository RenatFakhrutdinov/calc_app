import 'dart:math';

import 'package:calcapp/point_generator/generate_list_of_points.dart';
import 'package:calcapp/res/numbers.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/widgets/graph_widget.dart';
import 'package:flutter/material.dart';

class NativeModulePlotPage extends StatefulWidget {
  final String mathExpression;
  final num from;
  final num to;

  const NativeModulePlotPage({Key key, this.mathExpression, this.from, this.to})
      : super(key: key);

  @override
  _NativeModulePlotPageState createState() => _NativeModulePlotPageState();
}

class _NativeModulePlotPageState extends State<NativeModulePlotPage> {
  List<Point> points = [];

  @override
  void initState() {
    super.initState();
    points =
        generateListOfPoints(widget.mathExpression, widget.from, widget.to);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.nativeModule),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(standardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(widget.mathExpression),
            GraphWidget(points: points),
            Text('x from ${widget.from} to ${widget.to}')
          ],
        ),
      ),
    );
  }
}
