import 'dart:math';

import 'package:calcapp/presenter/randomizer.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/ui/graph_widget/graph_widget.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.title), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(
                controller: _mathExpressionController,
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
                      SizedBox(width: 8),
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
