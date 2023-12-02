//测试接口请求
import 'dart:developer';

import 'package:flutter_one/api/http_client.dart';
import 'package:flutter_one/api/model/homeinfo.dart';

import 'model/response_data.dart';

HttpClient client = HttpClient();
Future<HomeInfo> getTodayInfo() async{
  ResponseData res = await client.requestData("channel/one/2023-12-01/0");
  HomeInfo info = HomeInfo.fromJson(res.data??{});
  log("info：$info");
  return info;
}