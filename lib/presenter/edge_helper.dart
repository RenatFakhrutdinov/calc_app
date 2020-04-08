import 'dart:math';

class EdgeHelper {
  double minX(List<Point<num>> points) {
    double value;
    value = points
        .reduce((point1, point2) => point1.x < point2.x ? point1 : point2)
        .x;
    value = (value > 0.0) ? 0.0 : value;
    return value;
  }

  double maxX(List<Point<num>> points) {
    double value;
    value = points
        .reduce((point1, point2) => point1.x > point2.x ? point1 : point2)
        .x;
    value = (value < 0.0) ? 0.0 : value;
    return value;
  }

  double minY(List<Point<num>> points) {
    double value;
    value = points
        .reduce((point1, point2) => point1.y < point2.y ? point1 : point2)
        .y;
    value = (value > 0.0) ? 0.0 : value;
    return value;
  }

  double maxY(List<Point<num>> points) {
    double value;
    value = points
        .reduce((point1, point2) => point1.y > point2.y ? point1 : point2)
        .y;
    value = (value < 0.0) ? 0.0 : value;
    return value;
  }
}
