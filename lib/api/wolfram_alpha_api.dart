import 'dart:convert';

import 'package:calcapp/model/common_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WolframAlphaApi {
  static const String wolframAppId = "5GJP3X-4378GYWVUL";

  Future<CommonResponseModel> getPlot(
      {@required String mathExpression,
      @required num from,
      @required num to}) async {
    Response response;
    try {
      response = await Dio()
          .get("https://api.wolframalpha.com/v2/query", queryParameters: {
        "input": "plot $mathExpression, x=$from..$to",
        "format": "image",
        "output": "JSON",
        "appid": wolframAppId
      });
    } catch (e) {
      throw ('getPlot error: $e');
    }

    CommonResponseModel model;
    model = CommonResponseModel.fromJson(jsonDecode(response.data));
    return model;
  }
}
