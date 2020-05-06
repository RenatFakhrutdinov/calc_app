import 'dart:convert';

import 'package:calcapp/model/common_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WolframAlphaApi {
  static const String wolframAppId = "5GJP3X-4378GYWVUL";
  static const String wolframAlphaApiUrl =
      "https://api.wolframalpha.com/v2/query?input=plot";

  Future<CommonResponseModel> getPlot(
      {@required String mathExpression,
      @required num from,
      @required num to}) async {
    final plotUrl =
        "$wolframAlphaApiUrl $mathExpression, x=$from..$to&format=image&output=JSON&appid=$wolframAppId";
    http.Response response;
    try {
      response = await http.get(plotUrl);
    } catch (e) {
      throw ('getPlot error: $e');
    }

    CommonResponseModel model;
    model = CommonResponseModel.fromJson(jsonDecode(response.body));
    return model;
  }
}
