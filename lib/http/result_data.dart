class ResultData {
  int code;
  String status;
  String env;
  var data;
  ResultData({this.code, this.status, this.env, this.data});
  ResultData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    env = json['env'];
    if (json['data'] != null) {
      data = json['data'];
    }
  }
}