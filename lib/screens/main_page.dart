import 'dart:math';

import 'package:calcapp/presenter/randomizer.dart';
import 'package:calcapp/res/numbers.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/widgets/custom_card.dart';
import 'package:calcapp/widgets/graph_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _mathExpressionController =
      TextEditingController(text: Randomizer().randomExpression());

  final List<Point> data = [
    const Point(9, -5.0),
    const Point(-7.0, 9.0),
    const Point(13.0, 5.0),
    const Point(-13.0, -7.0),
  ];

  int minValue = -5;
  int maxValue = 5;

  RangeValues range = RangeValues(-5, 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.title), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(standardPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomCard(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      standardPadding, 0, standardPadding, standardPadding),
                  child: TextField(
                    controller: _mathExpressionController,
                    decoration:
                        InputDecoration(labelText: Strings.writeAnyExpression),
                  ),
                ),
              ),
              CustomCard(
                child: RangeSlider(
                  values: range,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      range = newRange;
                    });
                  },
                  divisions: divisionsOfRange,
                  min: minOfRange,
                  max: maxOfRange,
                  labels:
                      RangeLabels(range.start.toString(), range.end.toString()),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(Strings.plotTheFunction, textAlign: TextAlign.center),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text(Strings.nativeModule),
                          onPressed: () => print('plot the function'),
                        ),
                      ),
                      SizedBox(width: standardPadding),
                      Expanded(
                        child: RaisedButton(
                          child: Text(Strings.wolframAlphaApi),
                          onPressed: () => print('plot the function'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GraphWidget(
                points: data,
              )
            ],
          ),
        ));
  }
}
