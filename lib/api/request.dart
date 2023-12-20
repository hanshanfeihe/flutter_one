//测试接口请求
import 'dart:developer';

import 'package:flutter_one/api/http_client.dart';
import 'package:flutter_one/api/model/homeinfo.dart';

import 'model/response_data.dart';

HttpClient client = HttpClient();
//获取日期
String getDate(){
  DateTime now = DateTime.now();
  String year = now.year.toString();
  String month = now.month<10?'0${now.month}':'${now.month}';
  String day = now.day<10?'0${now.day}':'${now.day}';
  return '$year-$month-$day';
}
Future<HomeInfo> getTodayInfo() async{
  ResponseData res = await client.requestData("channel/one/${getDate()}/0");
  HomeInfo info = HomeInfo.fromJson(res.data??{});
  log("info：$info");
  return info;
}