// /list接口返回实例化
class ListResult {
  String name;
  String phone;
  String token;
  String address;
  String company;
  String avatar;

  ListResult(
      {this.name,
      this.phone,
      this.token,
      this.address,
      this.company,
      this.avatar});

  ListResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    token = json['token'];
    address = json['address'];
    company = json['company'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['token'] = this.token;
    data['address'] = this.address;
    data['company'] = this.company;
    data['avatar'] = this.avatar;
    return data;
  }
}