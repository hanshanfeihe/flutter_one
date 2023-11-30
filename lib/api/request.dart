//测试接口请求
import 'package:flutter_one/api/http_client.dart';

HttpClient client = HttpClient();
Future getTodayInfo() async{
  return client.requestData("channel/one/0/广州");
}