class Img {
  String src;
  String title;

  Img({this.src, this.title});

  Img.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    title = json['title'];
  }
}
