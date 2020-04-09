import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WolframAlphaApi {
  static const String wolframAppId = "5GJP3X-4378GYWVUL";
  static const String wolframAlphaApiUrl =
      "https://api.wolframalpha.com/v2/query?input=plot";
  http.Client httpClient = http.Client();

  Future<String> fetchPlot(
      {@required String mathExpression,
      @required num from,
      @required num to}) async {
    final plotUrl =
        "$wolframAlphaApiUrl $mathExpression, x=$from..$to&format=image&output=JSON&appid=$wolframAppId";
    final response = await httpClient.get(plotUrl);
    String result = response.body;
    return result;
  }
}
