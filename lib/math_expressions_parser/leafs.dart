import 'node.dart';

class ConstantLeaf extends Node {
  ConstantLeaf(this.number);
  num number;

  @override
  num call(String variable, num value) => number;
}

class VariableLeaf extends Node {
  VariableLeaf(this.symbol);
  String symbol;

  @override
  num call(String variable, num value) => value;
}
