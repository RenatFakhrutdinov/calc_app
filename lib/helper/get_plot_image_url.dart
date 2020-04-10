import 'package:calcapp/model/common_response_model.dart';
import 'package:calcapp/model/pods.dart';

String getPlotImageUrl(CommonResponseModel model) {
  String url;
  Pods podsWithPlot =
      model.queryResult.pods.singleWhere((pods) => pods.title == "Plot");
  url = podsWithPlot.subpods.first.img.src;
  return url;
}
