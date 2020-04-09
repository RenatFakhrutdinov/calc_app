import 'package:calcapp/res/strings.dart';
import 'package:flutter/material.dart';

class WolframAlphaPlotPage extends StatefulWidget {
  final String mathExpression;
  final num from;
  final num to;

  const WolframAlphaPlotPage({Key key, this.mathExpression, this.from, this.to})
      : super(key: key);

  @override
  _WolframAlphaPlotPageState createState() => _WolframAlphaPlotPageState();
}

class _WolframAlphaPlotPageState extends State<WolframAlphaPlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.wolframAlphaApi), centerTitle: true),
      body: Center(
        child: Text(widget.mathExpression),
      ),
    );
  }
}
