import 'package:calcapp/res/numbers.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Container(
          margin: EdgeInsets.fromLTRB(
              standardPadding, 0, standardPadding, standardPadding),
          child: child),
    );
  }
}
