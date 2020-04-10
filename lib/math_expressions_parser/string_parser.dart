import 'fork.dart';
import 'get_index_of_closing_parenthesis.dart';
import 'leafs.dart';
import 'node.dart';
import 'branch.dart';
import 'parenthesis_are_balanced.dart';

Node parseString(String expression, String variable) {
  // Check if numerical constant.
  {
    final x = num.tryParse(expression);
    if (x != null) {
      return ConstantLeaf(x);
    }
  }

  // Check if a variable.
  {
    if (variable == expression) {
      return VariableLeaf(variable);
    }
  }

  // Check if unary -.
  if (expression[0] == '-') {
    return NegativeBranch(parseString(expression.substring(1), variable));
  }

  // Check if unary +.
  if (expression[0] == '+') {
    return PositiveBranch(parseString(expression.substring(1), variable));
  }

  // Check if parentheses.
  if (expression[0] == '(') {
    final end = getIndexOfClosingParenthesis(expression);
    if (end == expression.length - 1) {
      return ParenthesisBranch(
          parseString(expression.substring(1, end), variable));
    }
  }

  // Check if a sqrt.
  final argumentIndex = 'sqrt'.length;

  if (expression.length >= argumentIndex &&
      expression.substring(0, argumentIndex) == 'sqrt') {
    if (expression[argumentIndex] == '(') {
      final end = getIndexOfClosingParenthesis(expression, argumentIndex);
      if (end == expression.length - 1) {
        return SqrtBranch(
            parseString(expression.substring(argumentIndex), variable));
      }
    }
  }

  // Helper for binary operations implementation.
  List<String> _leftRight(String operation) {
    if (expression.contains(operation)) {
      final split = expression.split(operation);
      for (var i = 1; i < split.length; i++) {
        final left = split.sublist(0, i).join(operation),
            right = split.sublist(i).join(operation);
        if (parenthesisAreBalanced(left) && parenthesisAreBalanced(right)) {
          return [left, right];
        }
      }
      return null;
    } else
      return null;
  }

  // Helper for binary operation definition.
  Node binaryOperationCheck(String character, String nodeName,
      Node Function(Node left, Node right) generator) {
    final lr = _leftRight(character);
    if (lr == null) return null;

    return generator(
        parseString(lr[0], variable), parseString(lr[1], variable));
  }

  // Check if +.
  {
    final sumCheck = binaryOperationCheck(
        '+', 'Sum Fork', (left, right) => SumFork(left, right));
    if (sumCheck != null) {
      return sumCheck;
    }
  }

  // Check if -.
  {
    final diffCheck = binaryOperationCheck(
        '-', 'Difference Fork', (left, right) => DifferenceFork(left, right));
    if (diffCheck != null) {
      return diffCheck;
    }
  }

  // Check if *.
  {
    final productCheck = binaryOperationCheck(
        '*', 'Product Fork', (left, right) => ProductFork(left, right));
    if (productCheck != null) {
      return productCheck;
    }
  }

  // Check if /.
  {
    final quotientCheck = binaryOperationCheck(
        '/', 'Quotient Fork', (left, right) => QuotientFork(left, right));
    if (quotientCheck != null) {
      return quotientCheck;
    }
  }

  // Check if %.
  {
    final remainderCheck = binaryOperationCheck(
        '%', 'Remainder Fork', (left, right) => RemainderFork(left, right));
    if (remainderCheck != null) {
      return remainderCheck;
    }
  }

  // Check if ^.
  {
    final powerCheck = binaryOperationCheck(
        '^', 'Power Fork', (left, right) => PowerFork(left, right));
    if (powerCheck != null) {
      return powerCheck;
    }
  }

  throw Exception('Bad expression: \'$expression\'...');
}
