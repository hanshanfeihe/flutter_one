import 'dart:developer';

import 'package:dio/dio.dart';

import 'model/response_data.dart';
String baseUrl = "http://v3.wufazhuce.com:8000/api/";
/// 网络请求单例
class HttpClient{
  late Dio dio;
  static final HttpClient _instance = HttpClient._internal();
  factory HttpClient() => _instance;
  HttpClient._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 12000),
      receiveTimeout: const Duration(milliseconds: 12000),
      headers: {},
      contentType: 'application/json',
      responseType: ResponseType.json
    );
    dio = Dio(options);
  }
  CancelToken cancelToken = CancelToken();

  //request请求
  Future<ResponseData> requestData(String path,{HttpType type = HttpType.get,Map<String,dynamic>? params,Options? options}) async{
    Response response = await handleRequest(path,type: type,params: params,options: options);
    log("response:$response");
    return ResponseData.fromJson(response.data);
  }
  Future<Response> handleRequest(String path,{HttpType type = HttpType.get,Map<String,dynamic>? params,Options? options}) async{
    switch (type){
      case HttpType.get:
        return await dio.get(path,queryParameters: params,options: options);
      case HttpType.post:
        return await dio.post(path,queryParameters: params,options: options);
    }
  }
}
//请求类型
enum HttpType{
  get,
  post,
  // file
}