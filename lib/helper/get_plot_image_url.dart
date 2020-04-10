import 'package:calcapp/model/common_response_model.dart';
import 'package:calcapp/model/pods.dart';

String getPlotImageUrl(CommonResponseModel model) {
  String url;
  Pods podsWithPlot;
  try {
    podsWithPlot =
        model.queryResult.pods.singleWhere((pods) => pods.title == "Plot");
    url = podsWithPlot.subpods.first.img.src;
  } catch (e) {
    url = 'getPlotImageUrl error: $e';
    print(url);

    ///pict just for fun =)
    return 'https://it.fffuuu.net/Upload/Images/porajeny_vashej_neudachej__sudar.png';
  }
  return url;
}
