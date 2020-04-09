import 'package:http/http.dart' as http;

class WolframAlphaApi {
  static const String wolframAppId = "5GJP3X-4378GYWVUL";
  static const String wolframAlphaApiUrl =
      "https://api.wolframalpha.com/v2/query?input=";
  http.Client httpClient = http.Client();

  Future<String> fetchPlot(String mathExpression) async {
    final plotUrl = "$wolframAlphaApiUrl$mathExpression&appid=$wolframAppId";
    final response = await httpClient.get(plotUrl);
    String result = response.body;
    return result;
  }
}
