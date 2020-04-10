import 'dart:math';

import 'node.dart';

abstract class Fork extends Node {
  Node left, right;
}

class SumFork extends Fork {
  SumFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      left(variable, value) + right(variable, value);
}

class DifferenceFork extends Fork {
  DifferenceFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      left(variable, value) - right(variable, value);
}

class ProductFork extends Fork {
  ProductFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      left(variable, value) * right(variable, value);
}

class QuotientFork extends Fork {
  QuotientFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      left(variable, value) / right(variable, value);
}

class RemainderFork extends Fork {
  RemainderFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      left(variable, value) % right(variable, value);
}

class PowerFork extends Fork {
  PowerFork(Node left, Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(String variable, num value) =>
      pow(left(variable, value), right(variable, value));
}
