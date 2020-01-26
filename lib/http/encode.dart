// 解析接口返回的数据处理业务异常场景
class ResultData {
  int code;
  var data;
  String status;
  String env;
  ResultData(this.code, this.data, this.status, this.env);
}