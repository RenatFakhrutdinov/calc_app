import 'package:calcapp/model/pods.dart';

class QueryResult {
  List<Pods> pods;

  QueryResult({this.pods});

  QueryResult.fromJson(Map<String, dynamic> json) {
    if (json['pods'] != null) {
      pods = new List<Pods>();
      json['pods'].forEach((v) {
        pods.add(new Pods.fromJson(v));
      });
    }
  }
}
