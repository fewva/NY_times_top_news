import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nt_top_news/config/config.dart';
import 'package:nt_top_news/models/resp.dart';

class Network {

  static Dio get _dio => Dio(
    BaseOptions(
      headers: {"Content-Type": "application/json"},
      baseUrl: Config.baseURL,
      responseType: ResponseType.plain,
    ),
  );

 static Future<Resp> getTopStories() async {
    final ans = await _dio.get('/topstories/v2/home.json?api-key=${Config.apiKey}');
    return Resp.fromJson(jsonDecode(ans.data));
  }

}