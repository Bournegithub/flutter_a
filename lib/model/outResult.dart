// 用于请求的返回json外层处理 
class OutResult {
  int code;
  String status;
  String env;
  var data;

  OutResult({this.code, this.status, this.env, this.data});

  OutResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    env = json['env'];
    if (json['data'] != null) {
      data = json['data'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['env'] = this.env;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}