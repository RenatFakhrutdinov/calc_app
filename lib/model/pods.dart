import 'package:calcapp/model/subpods.dart';

class Pods {
  String title;
  List<Subpods> subpods;

  Pods({
    this.title,
    this.subpods,
  });

  Pods.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subpods'] != null) {
      subpods = new List<Subpods>();
      json['subpods'].forEach((v) {
        subpods.add(new Subpods.fromJson(v));
      });
    }
  }
}
