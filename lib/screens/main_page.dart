import 'package:calcapp/helper/navigation.dart';
import 'package:calcapp/helper/randomizer.dart';
import 'package:calcapp/res/numbers.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _mathExpressionController =
      TextEditingController(text: Randomizer().randomExpression());

  RangeValues range = RangeValues(-5, 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.title), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(standardPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomCard(
                child: TextField(
                  controller: _mathExpressionController,
                  decoration:
                      InputDecoration(labelText: Strings.writeAnyExpression),
                ),
              ),
              CustomCard(
                child: Column(
                  children: <Widget>[
                    RangeSlider(
                      values: range,
                      onChanged: (RangeValues newRange) {
                        setState(() {
                          range = newRange;
                        });
                      },
                      divisions: divisionsOfRange,
                      min: minOfRange,
                      max: maxOfRange,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'x from ${range.start}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'to ${range.end}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(Strings.plotTheFunction, textAlign: TextAlign.center),

                  ///todo add validation before click buttons
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
                          onPressed: () => AppNavigator.toWolframAlphaPlotPage(
                              context,
                              mathExpression: _mathExpressionController.text,
                              from: range.start,
                              to: range.end),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
