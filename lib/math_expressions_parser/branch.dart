import 'dart:math';

import 'node.dart';

abstract class Branch extends Node {
  Node child;
}

class SqrtBranch extends Branch {
  SqrtBranch(Node child) {
    this.child = child;
  }

  @override
  num call(String variable, num value) => sqrt(child(variable, value));
}

class ParenthesisBranch extends Branch {
  ParenthesisBranch(Node child) {
    this.child = child;
  }

  @override
  num call(String variable, num value) => child(variable, value);
}

class NegativeBranch extends Branch {
  NegativeBranch(Node child) {
    this.child = child;
  }

  @override
  num call(String variable, num value) => -child(variable, value);
}

class PositiveBranch extends Branch {
  PositiveBranch(Node child) {
    this.child = child;
  }

  @override
  num call(String variable, num value) => child(variable, value);
}
