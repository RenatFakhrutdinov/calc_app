bool parenthesisAreBalanced(String expression) {
  var level = 0;
  for (var i = 0; i < expression.length; i++) {
    if (expression[i] == '(') {
      level++;
    } else if (expression[i] == ')') {
      level--;
    }
  }
  return level == 0;
}
