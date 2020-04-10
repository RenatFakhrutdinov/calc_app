import 'package:calcapp/api/wolfram_alpha_api.dart';
import 'package:calcapp/helper/get_plot_image_url.dart';
import 'package:calcapp/model/common_response_model.dart';
import 'package:calcapp/res/strings.dart';
import 'package:flutter/material.dart';

class WolframAlphaPlotPage extends StatefulWidget {
  final String mathExpression;
  final num from;
  final num to;

  const WolframAlphaPlotPage({Key key, this.mathExpression, this.from, this.to})
      : super(key: key);

  @override
  _WolframAlphaPlotPageState createState() => _WolframAlphaPlotPageState();
}

class _WolframAlphaPlotPageState extends State<WolframAlphaPlotPage> {
  WolframAlphaApi _wolframAlphaApi;

  @override
  void initState() {
    super.initState();
    _wolframAlphaApi = WolframAlphaApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.wolframAlphaApi), centerTitle: true),
      body: Center(
        child: FutureBuilder(
          future: _wolframAlphaApi.getPlot(
              mathExpression: widget.mathExpression,
              from: widget.from,
              to: widget.to),
          builder: (context, AsyncSnapshot<CommonResponseModel> snapshot) {
            if (snapshot.hasData) {
              String imageUrl = getPlotImageUrl(snapshot.data);
              return Image.network(imageUrl);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
