int getIndexOfClosingParenthesis(String expression,
    [int start = 0, String open = '(', String close = ')']) {
  int level = 0, index;
  for (index = start; index < expression.length; index++) {
    if (expression.substring(index, index + open.length) == open) {
      level++;
      index += open.length - 1;
    } else if (expression.substring(index, index + close.length) == close) {
      level--;
      if (level == 0) {
        break;
      }
      index += close.length - 1;
    }
  }
  return level == 0 ? index : -1;
}
