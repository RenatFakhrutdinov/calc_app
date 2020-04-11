import 'package:calcapp/res/strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.nativeModule),
        centerTitle: true,
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
