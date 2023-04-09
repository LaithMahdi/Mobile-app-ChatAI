class userModel {
  String? id;
  String? name;
  String? email;
  String? picture;
  String? password;

  userModel({
    this.id,
    this.name,
    this.email,
    this.picture,
    this.password,
  });

  userModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['picture'] = picture;
    data['password'] = password;
    return data;
  }
}
