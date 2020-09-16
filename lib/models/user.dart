class User {
  String name;
  String team;
  String manager;

  User({this.name, this.team, this.manager});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    team = json['team'];
    manager = json['manager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['team'] = this.team;
    data['manager'] = this.manager;
    return data;
  }
}
