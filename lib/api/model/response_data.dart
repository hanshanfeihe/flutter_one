import 'dart:convert';

class ResponseData {
  int? res; //响应状态码
  Map<String, dynamic>? data; //数据
  String? msg; //响应信息
  ResponseData({this.res, this.data, this.msg});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'res': res,
        'data': data,
        'msg': msg,
      };

  factory ResponseData.fromJson(Map<String, dynamic> response) {
    return ResponseData(
        res: response['res'], data: response['data'], msg: response['msg']);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
