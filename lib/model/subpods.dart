import 'package:calcapp/model/img.dart';

class Subpods {
  String title;
  Img img;

  Subpods({this.title, this.img});

  Subpods.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'] != null ? new Img.fromJson(json['img']) : null;
  }
}
