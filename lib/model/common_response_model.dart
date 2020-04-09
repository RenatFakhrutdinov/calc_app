import 'package:calcapp/model/query_result.dart';

class CommonResponseModel {
  QueryResult queryResult;

  CommonResponseModel({this.queryResult});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    queryResult = json['queryresult'] != null
        ? new QueryResult.fromJson(json['queryresult'])
        : null;
  }
}
