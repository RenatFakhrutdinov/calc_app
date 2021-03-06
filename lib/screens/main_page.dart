import 'package:calcapp/helper/navigation.dart';
import 'package:calcapp/helper/randomizer.dart';
import 'package:calcapp/res/numbers.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/res/warning_strings.dart';
import 'package:calcapp/validators/expression_is_correct.dart';
import 'package:calcapp/validators/from_is_not_equal_to.dart';
import 'package:calcapp/widgets/custom_card.dart';
import 'package:calcapp/widgets/show_snackbar_function.dart';
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
                decoration: InputDecoration(
                    labelText: Strings.writeAnyExpression,
                    errorText: WarningStrings.wrongExpression),
                onChanged: (text) {
                  setState(() {
                    expressionIsCorrect(text, range.start, range.end);
                  });
                },
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  WarningStrings.fromEqualTo,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
                CustomCard(
                  child: Column(
                    children: <Widget>[
                      RangeSlider(
                        values: range,
                        onChanged: (RangeValues newRange) {
                          setState(() {
                            range = newRange;
                            fromIsNotEqualTo(newRange.start, newRange.end);
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
              ],
            ),
            Column(
              children: <Widget>[
                Text(Strings.plotTheFunction, textAlign: TextAlign.center),

                /// Create an inner BuildContext so that the onPressed methods
                /// can refer to the Scaffold with Scaffold.of().
                Builder(builder: (innerContext) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            child: Text(Strings.nativeModule),
                            onPressed: () {
                              if (expressionIsCorrect(
                                      _mathExpressionController.text,
                                      range.start,
                                      range.end) &&
                                  fromIsNotEqualTo(range.start, range.end)) {
                                AppNavigator.toNativeModulePlotPage(context,
                                    mathExpression:
                                        _mathExpressionController.text,
                                    from: range.start,
                                    to: range.end);
                              } else
                                showSnackBar(innerContext);
                            }),
                      ),
                      SizedBox(width: standardPadding),
                      Expanded(
                        child: RaisedButton(
                            child: Text(Strings.wolframAlphaApi),
                            onPressed: () {
                              if (expressionIsCorrect(
                                      _mathExpressionController.text,
                                      range.start,
                                      range.end) &&
                                  fromIsNotEqualTo(range.start, range.end)) {
                                AppNavigator.toWolframAlphaPlotPage(context,
                                    mathExpression:
                                        _mathExpressionController.text,
                                    from: range.start,
                                    to: range.end);
                              } else
                                showSnackBar(innerContext);
                            }),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
