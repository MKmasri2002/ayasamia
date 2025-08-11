class UserModel {
  String? token;
  String? id;
  String? name;
  String? email;
  String? university;
  String? collage;
  UserModel({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.collage,
    required this.university,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      id: json['advisor']['_id'],
      name: json['advisor']['name'],
      email: json['advisor']['email'],
      collage: json['advisor']['collage'],
      university: json['advisor']['university'],
    );
  }
}
