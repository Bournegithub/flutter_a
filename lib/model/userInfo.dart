class UserInfo {
  String name;
  String phone;
  String mail;
  String introduce;
  String github;
  String avatar;

  UserInfo(
      {this.name,
      this.phone,
      this.mail,
      this.introduce,
      this.github,
      this.avatar});

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    mail = json['mail'];
    introduce = json['introduce'];
    github = json['github'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['mail'] = this.mail;
    data['introduce'] = this.introduce;
    data['github'] = this.github;
    data['avatar'] = this.avatar;
    return data;
  }
}