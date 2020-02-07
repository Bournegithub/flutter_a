class DetailParams {
  String id;
  String name;
  List<String> examplelist;

  DetailParams({this.id, this.name, this.examplelist});

  DetailParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    examplelist = json['examplelist'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['examplelist'] = this.examplelist;
    return data;
  }
}