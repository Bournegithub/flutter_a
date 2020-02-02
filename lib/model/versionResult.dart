// /version接口返回实例化
class VersionResult {
  String version;

  VersionResult({this.version});

  VersionResult.fromJson(Map<String, dynamic> json) {
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    return data;
  }
}