class LoginResult {
  String id;
  String name;
  String phone;
  String token;
  String address;
  String company;
  String avatar;

  LoginResult(
      {this.id,
      this.name,
      this.phone,
      this.token,
      this.address,
      this.company,
      this.avatar});

  LoginResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    token = json['token'];
    address = json['address'];
    company = json['company'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['token'] = this.token;
    data['address'] = this.address;
    data['company'] = this.company;
    data['avatar'] = this.avatar;
    return data;
  }
}