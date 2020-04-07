import 'package:calcapp/presenter/randomizer.dart';
import 'package:calcapp/res/strings.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _mathExpressionController =
      TextEditingController(text: Randomizer().randomExpression());

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
              RaisedButton(
                child: Text(Strings.plotTheFunction),
                onPressed: () => print('plot the function'),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Center(
                  child: Text('Graph'),
                ),
              )
            ],
          ),
        ));
  }
}
