class HomeParams {
  String params1;
  String params2;

  HomeParams({this.params1, this.params2});

  HomeParams.fromJson(Map<String, dynamic> json) {
    params1 = json['params1'];
    params2 = json['params2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['params1'] = this.params1;
    data['params2'] = this.params2;
    return data;
  }
}